#!/usr/local/bin/perl -w
use strict;

# Use the wxWidgets library for the GUI
use Wx;

# Setup for the GUI Frame, GUI events on the buttons.
package MyFrame;
use Wx::Event qw( EVT_BUTTON );
use base 'Wx::Frame';

#
# Set up the GUI window and populate it with structures such as buttons.
#
sub new {
   my $ref = shift;
   my $self = $ref->SUPER::new( undef,           # parent window
                                -1,              # ID -1 means any
                                'PokePhind',     # title
                                [-1, -1],        # default position
                                [250, 200],      # size
                              );

#
# Controls should not be placed directly inside a frame, use a Wx::Panel instead
#
   my $panel = Wx::Panel->new( $self,            # parent window
                               -1,               # ID
                             );

#
# Populate the game board with letters.
#
   my @chart = ("Gen 1", "Gen 2", "Gen 3", "Gen 4", "Gen 5", "All Gen", "Back");
    
#
# Create buttons that will hold the letters.
#

my @buttons;
{
    $buttons[0] = Wx::Button->new( $panel,         # parent window
                                   0,              # ID
                                   $chart[0],      # label
                                   [25, 80],      # position
                                   [100, 25],       # default size
                                 );

    $buttons[1] = Wx::Button->new( $panel,         # parent window
                                   1,              # ID
                                   $chart[1],      # label
                                   [125, 80],      # position
                                   [100, 25],       # default size
                                 );

    $buttons[2] = Wx::Button->new( $panel,         # parent window
                                   2,              # ID
                                   $chart[2],      # label
                                   [25, 100],     # position
                                   [100, 25],       # default size
                                 );
    $buttons[3] = Wx::Button->new( $panel,         # parent window
                                   3,              # ID
                                   $chart[3],      # label
                                   [125, 100],     # position
                                   [100, 25],       # default size
                                 );
   $buttons[4] = Wx::Button->new( $panel,         # parent window
                                   4,              # ID
                                   $chart[4],      # label
                                   [25, 120],     # position
                                   [100, 25],       # default size
                                 );
   $buttons[5] = Wx::Button->new( $panel,         # parent window
                                   5,              # ID
                                   $chart[5],      # label
                                   [125, 120],     # position
                                   [100, 25],       # default size
                                 );
   $buttons[6] = Wx::Button->new( $panel,         # parent window
                                   6,              # ID
                                   $chart[6],      # label
                                   [75, 145],     # position
                                   [100, 25],       # default size
                                 );
   
}

   my $i = 0;
   for ( $i=0; $i<6; $i++ ) {
      EVT_BUTTON( $buttons[$i],     # Object to bind to
                  $buttons[$i],         # ButtonID
                  \&genSelect, # Subroutine to execute
                );
   }
   EVT_BUTTON($self, $buttons[6], sub {
      my($self, $event) = @_;

      $self->Destroy;

   });

sub genSelect {
  my($self, $event) = @_;

  my $gen;
  if($self->GetLabel ne "All Gen") {
    $gen = substr($self->GetLabel, 4, 1);
  } else {
    $gen = 6;
  }

  system("perl gameboard.pl $gen");

}


   return $self;
}


#
# Prep the application.
#
package MyApp;
use base 'Wx::App';
   
#
# Set up actions for initialization of the Frame.
# 
sub OnInit {
   my $frame = MyFrame->new;
   $frame->Show( 1 );
}

#
# Application mainline.
#    
package main;
    
my $app = MyApp->new;
$app->MainLoop;
