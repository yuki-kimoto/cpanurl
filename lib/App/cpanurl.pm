use 5.008001;
package App::cpanurl;

our $VERSION = '0.01';

1;

=head1 NAME

App::cpanurl - Get module URL from name and version

=head1 CAUTION

B<This module is alpha release. Features will be changed without warnings.>

=head1 SYNOPSIS

  # http://cpan.metacpan.org/authors/id/S/SR/SRI/Mojolicious-3.82.tar.gz
  cpanurl Mojolicious 3.82
  
  # http://cpan.metacpan.org/authors/id/S/SR/SRI/Mojolicious-3.82.tar.gz
  # http://cpan.metacpan.org/authors/id/K/KI/KIMOTO/DBIx-Custom-0.23.tar.gz
  cpanurl -f module.txt
  
  # module.txt
  Mojolicious 3.82
  DBIx::Custom 0.23

=head1 DESCRIPTIONS

=head2 Get module URL

You can get module URL.

  # http://cpan.metacpan.org/authors/id/S/SR/SRI/Mojolicious-3.82.tar.gz
  cpanurl Mojolicious 3.82

If you want to get many module urls, you can use C<-f> option and module file.

  cpanurl -f module.txt

Module file is the following format.

  Mojolicious 3.82
  DBIx::Custom 0.23

You can get the following output

  http://cpan.metacpan.org/authors/id/S/SR/SRI/Mojolicious-3.82.tar.gz
  http://cpan.metacpan.org/authors/id/K/KI/KIMOTO/DBIx-Custom-0.23.tar.gz

=head2 Module installation

Use L<cpanm> with C<cpanurl> to install modules.

  cpanurl Mojolicious 3.82 | cpanm

If you want to install many modules, you can create module file.

  # module.txt
  Mojolicious 3.82
  DBIx::Custom 0.23

And use C<-f> option to read this file.

  cpanurl -f module.txt | cpanm

=head2 Module name is different from distribution name

Some module name is different from disttribution name.

  # Module name       Distribution name
  LWP                 libwww-perl
  IO::Compress::Base  IO-Compress
  Cwd                 PathTools
  File::Spec          PathTools
  List::Util          Scalar-List-Utils
  Scalar::Util        Scalar-List-Utils

For example, the following command failed.

  # Fail!
  cpanurl LWP 6.04

You must use distribution name in this case.

  cpanurl libwww-perl 6.04

=head2 HTTP client

L<cpanurl> use two HTTP client as necessary.

=over 2

=item 1. LWP::UserAgent

=item 2. HTTP::Tiny

=back

These module is used to get module URLs from metaCPAN.

If L<LWP::UserAgent> 5.802+ is installed, L<LWP::UserAgent>
is seleced. If not, L<HTTP::Tiny> is selected.

C<--lwp> option force L<LWP::UserAgent>.

  cpanurl --lwp Mojolicious 3.82

C<--no-lwp> option force L<HTTP::Tiny>.

  cpanurl --no-lwp Mojolicious 3.82

=head2 HTTP proxy

  export http_proxy=http://hostname:3001

C<http_proxy> environment variable enable you to use proxy server.

=head2 HTTP proxy authentication

  export http_proxy=http://username:password@hostname:3001

If L<LWP::UserAgent> 5.802+ is installed,
proxy authentication is available.
L<HTTP::Tiny> don't support proxy authentication.

=head1 LICENSE AND COPYRIGHT

Copyright 2013 Yuki Kimoto.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
