use strict;
use warnings;

use File::Find::Rule;
use File::Find::Rule::BOM;
use File::Object;
use Test::NoWarnings;
use Test::More 'tests' => 2;

# Data directory.
my $data_dir = File::Object->new->up->dir('data')->set;

# Test.
my @ret = File::Find::Rule->bom->relative->in($data_dir->s);
is_deeply(
	\@ret,
	[
		'UTF_16_bom',
		'UTF_32_bom',
		'UTF_8_bom',
	],
	'Get files with BOM in data directory.',
);
