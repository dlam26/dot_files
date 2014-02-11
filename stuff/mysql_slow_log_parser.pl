#!/usr/bin/perl 
#
# Nathanial Hendler
# http://retards.org/
#
#   from... http://www.mysqlperformanceblog.com/files/utils/mysql_slow_log_parser
#
# 2001-06-26 v1.0
#
# This perl script parses a MySQL slow_queries log file
# ignoring all queries less than $min_time and prints
# out how many times a query was greater than $min_time
# with the seconds it took each time to run.  The queries
# are sorted by number of times it took; the most often
# query appearing at the bottom of the output.
#
# Usage: mysql_slow_log_parser logfile
#
# ------------------------
# SOMETHING TO THINK ABOUT (aka: how to read output)
# ------------------------
#
# Also, it does to regex substitutions to normalize
# the queries...
#
#   $query_string =~ s/\d+/XXX/g;
#   $query_string =~ s/([\'\"]).+?([\'\"])/$1XXX$2/g;
#
# These replace numbers with XXX and strings found in
# quotes with XXX so that the same select statement
# with different WHERE clauses will be considered
# as the same query.
#
# so these...
#
#   SELECT * FROM offices WHERE office_id = 3;
#   SELECT * FROM offices WHERE office_id = 19;
#
# become...
#
#   SELECT * FROM offices WHERE office_id = XXX;
#
#
# And these...
#
#   SELECT * FROM photos WHERE camera_model LIKE 'Nikon%';
#   SELECT * FROM photos WHERE camera_model LIKE '%Olympus';
#
# become...
#
#   SELECT * FROM photos WHERE camera_model LIKE 'XXX';
#
#
# ---------------------
# THIS MAY BE IMPORTANT (aka: Probably Not)
# --------------------- 
#
# *SO* if you use numbers in your table names, or column
# names, you might get some oddities, but I doubt it.
# I mean, how different should the following queries be
# considered?
#
#   SELECT car1 FROM autos_10;
#   SELECT car54 FROM autos_11;
#
# I don't think so.
#


$min_time       = 0;	# Skip queries less than $min_time
$min_rows	= 0;
$max_display    = 10;	# Truncate display if more than $max_display occurances of a query

print "\n Starting... \n";

$query_string   = '';
$time           = 0;
$new_sql        = 0;


##############################################
# Loop Through The Logfile
##############################################

while (<>) {

	# Skip Bogus Lines

	next if ( m|/.*mysqld, Version:.+ started with:| );
	next if ( m|Tcp port: \d+  Unix socket: .*mysql.sock| );
	next if ( m|Time\s+Id\s+Command\s+Argument| );
	next if ( m|administrator\s+command:| );


	# print $_;
	# if ( /Query_time:\s+(.*)\s+Lock_time:\s+(.*)\s/ ) {
	#if ( /Query_time:\s+(.*)\s+Lock_time:\s+(.*)\s+Rows_examined:\s+(\d+)/ ) {
	if ( /Query_time:\s+(.*)\s+Lock_time:\s+(.*)\s+Rows_examined:\s+(.*)/ ) {

		$time    = $1;
		$rows	 = $3;
		$new_sql = 1;
		# print "found $1 $3\n";
		next;

	}


	if ( /^\#/ && $query_string ) {

			if (($time > $min_time) && ($rows >= $min_rows)) {
				$orig_query = $query_string;

				$query_string =~ s/\d+/XXX/g;
				$query_string =~ s/'([^'\\]*(\\.[^'\\]*)*)'/'XXX'/g;
				$query_string =~ s/"([^"\\]*(\\.[^"\\]*)*)"/"XXX"/g;
				#$query_string =~ s/([\'\"]).+?([\'\"])/$1XXX$2/g;
				#$query_string =~ s/\s+/ /g;
				#$query_string =~ s/\n+/\n/g;

				push @{$queries{$query_string}}, $time;
				push @{$queries_rows{$query_string}}, $rows;
				$queries_tot{$query_string} += $time;
				$queries_orig{$query_string} = $orig_query;
				$query_string = '';

			}

	} else {
		
		if ($new_sql) {
			$query_string = $_;
			$new_sql = 0;
		} else {
			$query_string .= $_;
		}
	}

}


##############################################
# Display Output
##############################################

foreach my $query ( sort { $queries_tot{$b} <=> $queries_tot{$a} } keys %queries_tot )  {
	my $total = 0; 
	my $cnt = 0;
	my @seconds = sort { $a <=> $b } @{$queries{$query}};
	my @rows    = sort { $a <=> $b } @{$queries_rows{$query}};
	($total+=$_) for @seconds;
	($cnt++) for @seconds;

	print "### " . @{$queries{$query}} . " Quer" . ((@{$queries{$query}} > 1)?"ies ":"y ") . "\n";
	print "### Total time: " . $total .", Average time: ".($total/$cnt)."\n";
	print "### Taking ";
	print @seconds > $max_display ? "$seconds[0] to $seconds[-1]" : sec_joiner(\@seconds);
	print " seconds to complete\n";
	print "### Rows analyzed ";
        print @rows > $max_display ? "$rows[0] - $rows[-1]": sec_joiner(\@rows);
	print "\n";
	
	print "$query\n";
	print $queries_orig{$query}."\n\n";
}


sub sec_joiner {
	my ($seconds) = @_;
	$string = join(", ", @{$seconds});
	$string =~ s/, (\d+)$/ and $1/;
	return $string;
}

exit(0);
