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
   my @chart = ("Leaderboard", "Playgame", "Quit");
    
#
# Create buttons that will hold the letters.
#

my @buttons;
{
    $buttons[0] = Wx::Button->new( $panel,         # parent window
                                   0,              # ID
                                   $chart[0],      # label
                                   [10, 80],      # position
                                   [100, 25],       # default size
                                 );

    $buttons[1] = Wx::Button->new( $panel,         # parent window
                                   1,              # ID
                                   $chart[1],      # label
                                   [140, 80],      # position
                                   [100, 25],       # default size
                                 );

    $buttons[2] = Wx::Button->new( $panel,         # parent window
                                   2,              # ID
                                   $chart[2],      # label
                                   [75, 110],     # position
                                   [100, 25],       # default size
                                 );

   
}

EVT_BUTTON($self, $buttons[1], sub {
  my($self, $event) = @_;

# OPEN THE OTHER PROGRAM FROM A MAC TODO Change if this is wrong
  system("perl generation.pl");

});

EVT_BUTTON($self, $buttons[2], sub {
  my($self, $event) = @_;

  $self->Destroy;

});


   return $self;
}

sub ButtonClicked
{
   my( $self, $event ) = @_;
  
    

#
# Change the contents of the button
#
#
# For debugging - print out a message.
#
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
