#!/usr/local/bin/perl -w

use Wx;


package MyFrame;
use base 'Wx::Frame';
use Wx::Event qw(EVT_BUTTON);

#############
# FUNCTIONS #
#############

# GARBAGE LETTERS #
# Create an array of strings containing random letters, creating a grid of sizeXsize
sub garbage {

  my($grid) = $_[0];
  my($size) = $_[1];
  my(@alpha) = (A..Z);
# Array passed be reference: Each element of the array represents a row of the letter grid
  my($i);
  my($j);
  for($i=0; $i<$size; $i++) {
    for($j=0; $j<$size; $j++) {
# Pick random letters and add them to a slot in the array
  my $read = gread(\@{$grid},$j, $i);
      if($read eq ' ') {
	my($rand) = int(rand(26));
	gwrite(\@{$grid}, $alpha[$rand], $j, $i);
      }
    }
  }

}


# WRITE TO GRID #
# Insert a letter at the coordinates specified as arguments.
sub gwrite {

  my($grid) = $_[0];
  my($letter) = $_[1];
  my(@coords) = ($_[2], $_[3]);

  my(@row) = split("", ${$grid}[$coords[1]]);
  $row[$coords[0]] = "$letter";
  ${$grid}[$coords[1]] = join("", @row);

}


# READ FROM GRID #
# Return the letter at the coordinates specified as arguments.
sub gread {

  my($grid) = $_[0];
  my(@coords) = ($_[1], $_[2]);

  my(@letter) = split("", ${$grid}[$coords[1]]);

  return $letter[$coords[0]];

}

# CREATE A STRING #
# Creates a string of $char appearing $num times.
sub string {
  my $char = $_[0];
  my $num = $_[1];
  my $string = "";
  my $i;
  
  for($i=0; $i<$num; $i++) {
    $string = $string.$char;
  }

  return $string;
}

## TODO : THESE ARE THE GRID CREATION FUNCTIONS ##
#################################
# Input the created grid here #
sub locationValid{

  my($grid) = $_[0];
  my($len) = $_[1];
  my($word) = $_[2];
  my($xStart) = $_[3];
  my($yStart) = $_[4];
  my($direction) = $_[5];


  my $valid = 0;
  my $letter;
  my $letterOnGrid;
  print "\ninto location valid\n";
  print "Direction in location Valid: $direction\n";
  print "xStart in location valid: $xStart\n";
  print "yStart in location valid: $yStart\n";
     if ($direction == 1) #right
     {
	
        for($i = 0;$i< $len;$i++)
        {
           my $letter = substr($word,($i),1);
	   $letterOnGrid = gread($grid, ($xStart+$i), $yStart);
           #print "letter on grid: $letterOnGrid --\n";
	   if ($letterOnGrid eq $letter || $letterOnGrid eq " ")
	   {  
             # print ("This is good, yeah?\n");
	      $valid = 1;
	   }
	   else
	   {
  	      #print "INVALID!!!\n";
	      return 0;
	   }
        	
        }
	return 1;
     }
     elsif($direction ==2) #left
     {
        for($i = 0;$i< $len;$i++)
        {
           my $letter = substr($word,($i),1);
	   $letterOnGrid = gread($grid, ($xStart-$i), $yStart);
           #print "letter on grid: $letterOnGrid --\n";
	   if ($letterOnGrid eq $letter || $letterOnGrid eq " ")
	   {  
              #print ("This is good, yeah?\n");
	      $valid = 1;
	   }
	   else
	   {
  	      #print "INVALID!!!\n";
	      return 0;
	   }
        	
        }
	return 1;
     }
     elsif($direction ==3) #down
     {
         for($i = 0;$i< $len;$i++)
        {
           my $letter = substr($word,($i),1);
	   $letterOnGrid = gread($grid, $xStart, ($yStart+$i));
          # print "letter on grid: $letterOnGrid --\n";
	   if ($letterOnGrid eq $letter || $letterOnGrid eq " ")
	   {  
              #print ("This is good, yeah?\n");
	      $valid = 1;
	   }
	   else
	   {
  	     # print "INVALID!!!\n";
	      return 0;
	   }
        	
        }
	return 1;
     }
     elsif($direction ==4) #up
     {
        for($i = 0;$i< $len;$i++)
        {
           my $letter = substr($word,($i),1);
	   $letterOnGrid = gread($grid, $xStart, ($yStart-$i));
           #print "letter on grid: $letterOnGrid --\n";
	   if ($letterOnGrid eq $letter || $letterOnGrid eq " ")
	   {  
            #  print ("This is good, yeah?\n");
	      $valid = 1;
	   }
	   else
	   {
  	     # print "INVALID!!!\n";
	      return 0;
	   }
        	
        }
	return 1;
     }
     elsif($direction ==5) #up-right
     {
#	print "In direction thing\n";
	 for($i = 0;$i< $len;$i++)
        {
           my $letter = substr($word,($i),1);
	   $letterOnGrid = gread($grid, ($xStart+$i), ($yStart-$i));
           #print "letter on grid: $letterOnGrid --\n";
	   if ($letterOnGrid eq $letter || $letterOnGrid eq " ")
	   {  
              #print ("This is good, yeah?\n");
	      $valid = 1;
	   }
	   else
	   {
  	      #print "INVALID!!!\n";
	      return 0;
	   }
        	
        }
	return 1;        
     }


     elsif($direction ==6) #down-right
     {
         for($i = 0;$i< $len;$i++)
        {
           my $letter = substr($word,($i),1);
	   $letterOnGrid = gread($grid, ($xStart+$i), ($yStart+$i));
           #print "letter on grid: $letterOnGrid --\n";
	   if ($letterOnGrid eq $letter || $letterOnGrid eq " ")
	   {  
              #print ("This is good, yeah?\n");
	      $valid = 1;
	   }
	   else
	   {
  	      #print "INVALID!!!\n";
	      return 0;
	   }
        	
        }
	return 1;      
 }
 

     elsif($direction ==7) #down-left
     {
	 for($i = 0;$i< $len;$i++)
        {
           my $letter = substr($word,($i),1);
	   $letterOnGrid = gread($grid, ($xStart-$i), ($yStart+$i));
          # print "letter on grid: $letterOnGrid --\n";
	   if ($letterOnGrid eq $letter || $letterOnGrid eq " ")
	   {  
              #print ("This is good, yeah?\n");
	      $valid = 1;
	   }
	   else
	   {
  	     # print "INVALID!!!\n";
	      return 0;
	   }
        	
        }
	return 1;             


     }


     elsif($direction ==8) #up-left
     {
	 for($i = 0;$i< $len;$i++)
        {
           my $letter = substr($word,($i),1);
	   $letterOnGrid = gread($grid, ($xStart-$i), ($yStart-$i));
          # print "letter on grid: $letterOnGrid --\n";
	   if ($letterOnGrid eq $letter || $letterOnGrid eq " ")
	   {  
              #print ("This is good, yeah?\n");
	      $valid = 1;
	   }
	   else
	   {
  	      #print "INVALID!!!\n";
	      return 0;
	   }
        	
        }
	return 1;        

     }


}






#
#checks coordinates with direction to make sure words aren't printed out of bounds
#
 sub coordCheck {

  my($grid) = $_[0]; 
  my($len) = $_[1]; #reads arguments
  my($direction) = $_[2];
  my($xStart) = $_[3];
  my($yStart) = $_[4];
  my($word) = $_[5];
  my($size) = $_[6];

  print "$direction in coord check\n";

  $valid=0; #inits to zero
  $xValid=0;
  $yValid=0;

  while($valid==0) #loops through until a proper starting position is found
  {
    if($direction==1)#right
    {
      #print ("$len\n");

      if(($xStart+$len)<($size-1) && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
 	printf ("location valid: %d\n", (locationValid($grid, $len, $word, $xStart, $yStart, $direction)));
        $valid=1;
      }
      else
      {
        $xStart--;
	print ("$xStart\n");
	if ($xStart < 0)
	{
	  $xStart = int(rand($size - 1));
	  $yStart = int(rand($size - 1));
 	  $direction = int(rand(7)+1);

	}
      }
   }
   elsif($direction==2 ) #left
    {
      if(($xStart-$len)>0  && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
	printf ("location valid: %d\n", (locationValid($grid, $len, $word, $xStart, $yStart, $direction)));
        $valid=1;
      }
      else
      {
        $xStart++;
	if ($xStart > ($size - 1))
	{
	   $xStart =  int(rand($size - 1));
	   $yStart =  int(rand($size - 1));
	   $direction = int(rand(7)+1);
 
	}
      }
   }
   elsif($direction==3 ) #down
    {
      if(($yStart+$len)<($size-1) && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
	printf ("location valid: %d\n", (locationValid($grid, $len, $word, $xStart, $yStart, $direction)));

        $valid=1;
      }
      else
      {
        $yStart--;
	if ($yStart < 0)
	{
	   $xStart =  int(rand($size - 1));
	   $yStart =  int(rand($size - 1));
	   $direction = int(rand(7)+1);

	}
      }
   }
   elsif($direction==4 ) #up
    {
      if(($yStart-$len)>0 && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
	printf ("location valid: %d\n", (locationValid($grid, $len, $word, $xStart, $yStart, $direction)));
        $valid=1;
      }
      else
      {
        $yStart++;
	if ($yStart > ($size - 1))
	{
	   $xStart =  int(rand($size - 1));
	   $yStart =  int(rand($size - 1));
  	   $direction = int(rand(7)+1);
	
	}
      }
   }
   elsif($direction==5 ) #up-right
    {
      if(($xStart+$len)<($size-1) && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
        $xValid=1;
      }
      else
      {
        $xStart--;
	#print ("$xStart\n");
	if ($xStart < 0)
	{
	  #print "xstart is negative\n";
	  $xStart = int(rand($size - 1));
	  $yStart = int(rand($size - 1));
	  $direction = int(rand(7)+1);
   	  #print "Direction in xstart thing: $direction\n";
	}

      }

      if(($yStart-$len)>0  && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
         $yValid=1;
      }
      else
      {
        $yStart++;
	if ($yStart > ($size - 1))
	{
	   print "yStart is positive\n";
	   $xStart =  int(rand($size - 1));
	   $yStart =  int(rand($size - 1));
	   $direction = int(rand(7)+1);

	}

      }
   }
   elsif($direction==6 ) #down-right
    {
      if(($xStart+$len)<($size-1) && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
        $xValid=1;
      }
      else
      {
        $xStart--;
	if ($xStart < 0)
	{
	  $xStart = int(rand($size - 1));
	  $yStart = int(rand($size - 1));
 	  $direction = int(rand(7)+1);

	}
	
      }

      if(($yStart+$len)<($size-1) && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
         $yValid=1;
      }
      else
      {
        $yStart--;
	if ($yStart < 0)
	{
	   $xStart =  int(rand($size - 1));
	   $yStart =  int(rand($size - 1));
	   $direction = int(rand(7)+1);

	}

      }
   }
   elsif($direction==7) #down left
    {
      if(($xStart-$len)>0  && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
        $xValid=1;
      }
      else
      {
        $xStart++;
	if ($xStart > ($size - 1))
	{
	   $xStart =  int(rand($size - 1));
	   $yStart =  int(rand($size - 1));
	   $direction = int(rand(7)+1);

	}

      }

      if(($yStart+$len)<($size-1) && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
         $yValid=1;
      }
      else
      {
 	$yStart--;
	if ($yStart < 0)
	{
	   $xStart =  int(rand($size - 1));
	   $yStart =  int(rand($size - 1));
	   $direction = int(rand(7)+1);

	}

      }
   }
   elsif($direction==8) #up left
   {
      if(($xStart-$len)>0 && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
        $xValid=1;
      }
      else
      {
        $xStart++;
	if ($xStart > ($size - 1))
	{
	   $xStart =  int(rand($size - 1));
	   $yStart =  int(rand($size - 1));
	   $direction = int(rand(7)+1);

	}

      }

      if(($yStart-$len)>0 && (locationValid($grid, $len, $word, $xStart, $yStart, $direction) == 1))
      {
         $yValid=1;
      }
      else
      {
        $yStart++;
	if ($yStart > ($size - 1))
	{
	   $xStart =  int(rand($size - 1));
	   $yStart =  int(rand($size - 1));
 	   $direction = int(rand(7)+1);

	   
	}

      }
   }
   if ($xValid == 1 && $yValid == 1)
   {
       $valid = 1;
   }
 }
 $coords[0] = $xStart;
 $coords[1] = $yStart;
 $coords[2] = $direction;
 return @coords;
}


sub wordsToGrid{

  my($grid) = $_[0];
  my($word) = $_[1];
  my($direction) = $_[2]; #direction and word passed in
  my($size) = $_[3];#size read in
  #my $j = $_[3];
  
  my $i = 0;
  my $len = length($word);
  #coordinate checking will determine coordinates
  
  $xStart = int(rand($size-1));
  $yStart = int(rand($size-1));
  
  my @coords = coordCheck ($grid, $len, $direction, $xStart, $yStart, $word, $size);

  $xStart = $coords[0]; #determined by coordinate checking function
  $yStart = $coords[1];
  $direction = $coords[2];
 # print "xstart: $xStart\n";
  #print "ystart: $yStart\n\n"; #test
  
  if ($direction == 1) #right
  {
	
     for($i = 0;$i< $len;$i++)
     {
        my $letter = substr($word,($i),1);
        gwrite(\@{$grid}, $letter,($xStart+$i),$yStart);
	
     }
  }
  elsif($direction ==2) #left
  {
     for($i = 0;$i< $len;$i++)
     {
        my $letter = substr($word,($i),1);
        gwrite(\@{$grid}, $letter,($xStart-$i),$yStart);
     }
  }
  elsif($direction ==3) #down
  {
      for($i = 0;$i< $len;$i++)
      {
         my $letter = substr($word,($i),1);
         gwrite(\@{$grid}, $letter,$xStart,($yStart+$i));
      }
  }
  elsif($direction ==4) #up
  {
      for($i = 0;$i< $len;$i++)
      {
         my $letter = substr($word,($i),1);
         gwrite(\@{$grid}, $letter,$xStart,($yStart-$i));
      }
  }
  elsif($direction ==5) #up-right
  {
      for($i = 0;$i< $len;$i++)
      {
         my $letter = substr($word,($i),1);
         gwrite(\@{$grid}, $letter,($xStart+$i),($yStart-$i));
      }
  }


  elsif($direction ==6) #down-right
  {
      for($i = 0;$i< $len;$i++)
      {
         my $letter = substr($word,($i),1);
         gwrite(\@{$grid}, $letter,($xStart+$i),($yStart+$i));
      }
  }
 

  elsif($direction ==7) #down-left
  {
      for($i = 0;$i< $len;$i++)
      {
         my $letter = substr($word,($i),1);
         gwrite(\@{$grid}, $letter,($xStart-$i),($yStart+$i));
      }
  }


  elsif($direction ==8) #up-left
  {
      for($i = 0;$i< $len;$i++)
      {
         my $letter = substr($word,($i),1);
         gwrite(\@{$grid}, $letter,($xStart-$i),($yStart-$i));
      }
  }
 

}



#
#Chooses 10 words from the desired generation
#might need generation passed in (later from button)
#
sub getWords{

  $gen = $_[0]; #selected generation passed in from the button click
  $maxWords = 10;
  $numWords = 0;
  $i = 0;

  $fileName = sprintf ("generation%d.txt", $gen);
  chomp $fileName;

  open FILE, $fileName or die $!;

  while (my $word = <FILE>) {
     $numWords++;
  #
  # remove the newline character from the end of the line
  #
     chop $word;
     $allPokemon[$i] = uc($word);
     $i++;
  }
  close FILE;
  $numSelected = 0;

  $range = $numWords-1;
  for ($numSelected = 0; $numSelected < $maxWords; $numSelected++)
  {
      $randNum = rand($range);
      $gridWords[$numSelected] = $allPokemon[$randNum];
      splice(@allPokemon, $randNum,1);
      $range = $range-1;
  }

  return @gridWords;

}

sub createGrid{

my(@grid);
my($size) = $_[0];
my($words) = $_[1];
my($i);
my($j);
my($gen) = $ARGV[0];

for($i=0; $i<$size; $i++) {
	$grid[$i] = string(" ", $size);
}


@{$words} = getWords($gen);


for($i=0; $i<10; $i++)
{ 
  $direction = int(rand(7)+1); 
  #$direction = 8;
  print "New word here: $direction\n";
  wordsToGrid(\@grid,${$words}[$i],$direction, $size);
 }
#gwrite(\@grid, $letter, 7, 7);

print "@{$words}\n"; #test

return @grid;
}


##################################
## TODO: END OF CREATE GRID FUNCTIONS ##


# Return 1 if the two inputs are next to eachother
sub isClose {
# Inputs are the IDs of buttons
  my ($input1, $input2, $size) = @_;

  my @coord1 = getCoords($input1, $size);
  my @coord2 = getCoords($input2, $size);

# Find the distance between two positions
  my $diff = sqrt(($coord2[0]-$coord1[0])**2 + ($coord2[1]-$coord1[1])**2);

# Return 1 if the two objects are next to eachother or diagonal (i.e. either $diff is 1 or sqrt(2))
  if($diff < 2) {
    return 1;
  } else {
    return 0;
  }
}


# Get Coords based on button ID input
sub getCoords {
  my $ID = $_[0];
  my $size = $_[1];

# ID is converted to $x*$size + $y which is base $size
  $x = int($ID/$size)*$size;
  $y = $ID - $x;
  $x = $x/$size;

  @coords = ($x, $y);

  return @coords;
}


##################################


sub new {

  my $i;
  my $j;
  my @grid;
  my $size = 20;
# Colour is the colour of the buttons
  $colour;
  @allwords;
# found is the array with the found words and num found is the int value of how many have been found
  @found;
  $numfound = 0;
  @button;
# letters will store which letters are selected and pos will keep track of how many letters there are
  @letters;
  $pos = 0;
# ID will be the previous button location pressed, to make sure the next one is right next one is next to it
# IDs is the array containing ALL of the IDs selected
  @IDs;
  $ID = -1;


######################################
# Create the grid
@grid = createGrid($size, \@allwords);
######################################

#Temporary garbage function for TESTING
 garbage(\@grid, $size);


  my $ref = shift;
  $self = $ref->SUPER::new(undef, -1, 'PokePhind', [-1,-1], [670,590]);
# Pokemon Battle Music
  $sound = Wx::Sound->new("BattleMusic.wav");
  $sound->Play;
  $panel = Wx::Panel->new($self, -1);

#Double For loop to make all the buttons
  for($i=0; $i<$size; $i++) {
    for($j=0; $j<$size; $j++) {
      $button[$i*$size+$j] = Wx::Button->new($panel, 
					    $i*$size+$j, # The ID of the buttons can be converted into base_$size to find the coordinates
					    gread(\@grid, $j, $i),
					    [10+$j*25, 80+$i*25],
					    [25,25],
					    );
    }
  }
  $colour = $button[0]->GetBackgroundColour;
# Other buttons for selection, clearing and leaving
  my $back = Wx::Button->new($panel, -1, "Back", [10,10], [100,25]);
  my $select = Wx::Button->new($panel, -1, "Select", [20+$size*25, 80], [100,25]);
  my $clear = Wx::Button->new($panel, -1, "Clear", [20+$size*25, 110], [100,25]);

# Wordslist
  my $swords = join("\n", @allwords);
  $text = Wx::StaticText->new($panel,
				-1, 
				"Wild Pokemon\n\n$swords", 
				[20+$size*25, 140], 
				[125,200],
				);

# Foundlist
# Starts empty
  $foundtext = Wx::StaticBox->new($panel,
				  -1,
				  "",
				  [20+$size*25, 380],
				  [125,200],
				  );

  
# OnClick functions for buttons
  for($i=0; $i<($size)*($size); $i++) {
    EVT_BUTTON($button[$i], $button[$i], \&selectletter);
  }
  EVT_BUTTON($self, $back, \&quit);
  EVT_BUTTON($panel, $select, \&wordcheck);
  EVT_BUTTON($self, $clear, \&clearletters);

  
# Check if any words have been selected
#######################################
  sub wordcheck {
    my($self, $event) = @_;
# Combine the letters into a string
    my $selected = join("", @letters);
    my $i;
# Confirm will check if anything is found
    my $confirm = 0;
    my $val;
    
# Check if this word matches any of the words we're looking for (either forwards or backwards)
    for($i=0; $i<10; $i++) {
      if($selected eq $allwords[$i] || reverse($selected) eq $allwords[$i]) {
# If it's found, add the word to the found words list and increase the number of words found
	print "$allwords[$i] found!\n";
	$confirm = 1;
	$found[$numfound] = $allwords[$i];
	$numfound++;
	$allwords[$i] = " ";

# Found words will be yellow
	foreach $val (@IDs) {
	  $button[$val]->SetBackgroundColour(Wx::Colour->new(255,255,000));
	}

# Destroy the existing StaticText and replace it with one showing only the remaining pokemon
	$text->Destroy;
	my $swords = join("\n", @allwords);
	$text = Wx::StaticText->new($panel, -1, "Wild Pokemon\n\n$swords", [20+$size*25, 140], [125,200]);

# Destroy the existing StaticText and replace it with one showing the new pokemon as well as the old ones
	$foundtext->Destroy;
	$swords = join("\n", @found);
	$foundtext = Wx::StaticText->new($self, -1, "Caught!\n\n$swords", [20+$size*25, 380], [125,250]);
      }
    }

# If all the pokemon are found then display a congratulations message at the top
    if($numfound == 10) {
      my $congrats = Wx::StaticText->new($panel, -1, "Congratulations! You've caught 'em all!", [200,50], [400,100]);
    }

# If no word was found, put all buttons back to default colour
    if($confirm == 0) {
      foreach $val (@IDs) {
	$button[$val]->SetBackgroundColour(Wx::Colour->new($colour));
      }
    }

# Reinitialize the values for letters and buttons
    undef(@IDs);
    undef(@letters);
    $pos = 0;
    $ID = -1;

   }
    
 
# Letter button fuction
#######################
  sub selectletter {
    my($self, $event) = @_;

    if($ID == -1 || isClose($self->GetId, $ID, $size) == 1) {
      $ID = $self->GetId;
      push(@IDs, $ID);

# Add the clicked letter to the letter array and increase the number of letters ($pos). Change colour of button
      $letters[$pos] = $self->GetLabel;
      $pos++;
      $self->SetBackgroundColour(Wx::Colour->new(255,000,000));
      }

  }


# Clear letters to let a new word be selected
#############################################
  sub clearletters {
    my($self, $event) = @_;
    my $val;

# Put all selected buttons back to default colour
    foreach $val (@IDs) {
      $button[$val]->SetBackgroundColour(Wx::Colour->new($colour));
    }

# Clear @letters and return $pos to 0 and $ID to -1
    undef(@letters);
    undef(@IDs);
    $pos = 0;
    $ID = -1;
  }



# Quit the gameboard frame
##########################
  sub quit {
    my($self, $event) = @_;
  
# Destroy the frame
    $self->Destroy;

  }

return $self;
}



package MyApp;
use base 'Wx::App';

sub OnInit {

    my $frame = MyFrame->new;
    $frame->Show(1);

}


package main;

my $app = MyApp->new;
$app->MainLoop;
