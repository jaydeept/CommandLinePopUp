use strict;
use warnings;
use Getopt::Long;
use Tk;
my ($printHelp, $commands, $delimiter);
GetOptions("commands=s"             =>\$commands,
           "delimiter=s"            =>\$delimiter,
		   "h"                      =>\$printHelp
		   );
		   
if ($commands)
{
    my @cmd_list;
	if($delimiter)
	{
		@cmd_list = split($delimiter, $commands);
	}
	else
	{
		@cmd_list = split(',', $commands);
	}
	foreach my $cmd ( @cmd_list )
	{
		print "Executing: $cmd\n";
		system($cmd);
	}
	
	# Main Window
    my $mw = new MainWindow;
    $mw -> messageBox(-message=>"Successfully completed the commands: $commands");
}
else
{
	showUsage();
    exit 1;
}

if($printHelp)
{
	showUsage();
    exit 1;
}

sub showUsage
{
	print "\nDESCRIPTION:\n";
	print "This script will execute the provided commands (by default comma separated) and pop-up the message when execution is completed.\n";
	print "Example:\n";
	print "\ncommand.pl -commands \"command1,command2\"\n";
	print "\ncommand.pl -commands \"command1:command2\" -delimiter=\":\"\n";
	print "\ncommand.pl -commands \"b -f \\\"compile libs\\\" libp\"\n";
}
