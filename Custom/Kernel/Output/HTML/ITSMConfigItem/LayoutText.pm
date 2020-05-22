

    my $Class    = '';
    my $Size     = 'W50pc';
    my $Required = $Param{Required};
    my $Invalid  = $Param{Invalid};
    my $ItemId   = $Param{ItemId};
    
    ########ADD THIS CODE PART 1##################
    #### for readonly definition###########
    my $ReadOnly = $Param{ReadOnly};  
    ########END CODE######################

    ###-----------------SNIP---------------------#####
    
    if ($Value) {

        # get layout object
        my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

        # translate
        if ( $Param{Item}->{Input}->{Translation} ) {
            $Value = $LayoutObject->{LanguageObject}->Translate($Value);
        }
        
        ########ADD THIS CODE PART 2##################
        #### for readonly definition###########
        if ( $Param{Item}->{Input}->{ReadOnly} and $Value ne '' ) {
       	$String .= 'readonly="readonly" ';
        }
        ########END CODE########################

        ###-----------------SNIP---------------------#####
        
    }

  ###-----------------SNIP---------------------#####
