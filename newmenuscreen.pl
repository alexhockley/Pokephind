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
                                'WordPhind',     # title
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
                                   [100, 100],       # default size
                                 );

    $buttons[1] = Wx::Button->new( $panel,         # parent window
                                   1,              # ID
                                   $chart[1],      # label
                                   [130, 80],      # position
                                   [100, 100],       # default size
                                 );

    $buttons[2] = Wx::Button->new( $panel,         # parent window
                                   2,              # ID
                                   $chart[2],      # label
                                   [80, 100],     # position
                                   [100, 100],       # default size
                                 );

   
}

   my $i = 0;
   for ( $i=0; $i<3; $i++ ) {
      EVT_BUTTON( $buttons[$i],     # Object to bind to
                  $i,         # ButtonID
                  \&ButtonClicked # Subroutine to execute
                );
   }


   return $self;
}

sub ButtonClicked
{
   my( $self, $event ) = @_;

  # my $str = $self->GetLabel;
   my $window = Wx::Frame->new($self, -1, "Window", [-1,-1], [-1,-1],);
     Wx::Window::Show($window);

# TESTING TO CHANGE
  $self->Destroy;
#  system("perl gameboard_integrate.pl");
   
# Populate the game board with letters.

#

    my @chart = ("G1", "G2", "G3", "G4", "G5", "ALL-GEN", "BACK");



#

# Create buttons that will hold the letters.

#



    my @buttons;

    {

        $buttons[0] = Wx::Button->new( $window,         # parent window

                0,              # ID

                $chart[0],      # label

                [10, 80],      # position

            [100, 100],       # default size

                                         );



        $buttons[1] = Wx::Button->new( $window,         # parent window

                1,              # ID

                $chart[1],      # label

                [110, 80],      # position

            [100, 100],       # default size

                                         );



        $buttons[2] = Wx::Button->new( $window,         # parent window

                2,              # ID

                $chart[2],      # label

                [10, 100],     # position

            [100, 100],       # default size

                                         );

        $buttons[3] = Wx::Button->new( $window,         # parent window

                3,              # ID

                $chart[3],      # label

                [110, 100],     # position

            [100, 100],       # default size

                                         );

        $buttons[4] = Wx::Button->new( $window,         # parent window

                4,              # ID

                $chart[4],      # label

                [10, 120],     # position

            [100, 100],       # default size

                                         );

        $buttons[5] = Wx::Button->new( $window,         # parent window

                5,              # ID

                $chart[5],      # label

                [110, 120],     # position

            [100, 100],       # default size

                                         );

        $buttons[6] = Wx::Button->new( $window,         # parent window

                6,              # ID

                $chart[6],      # label

                [60, 140],     # position

            [100, 100],       # default size

                                         );



    }

   

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
