##################SNIP#################################

sub InputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my $Value = $Param{Value};
    if ( !defined $Param{Value} ) {
        $Value = $Param{Item}->{Input}->{ValueDefault} || '';
    }

    my $Class    = '';
    my $Size     = 'W50pc';
    my $Required = $Param{Required};
    my $Invalid  = $Param{Invalid};
    my $ItemId   = $Param{ItemId};
    ########ADD THIS CODE PART 1##################
    #### for readonly definition###########
    my $ReadOnly = $Param{ReadOnly};  
    ########END CODE###################### 
    
    if ($Required) {
        $Class .= ' Validate_Required';
    }

    if ($Invalid) {
        $Class .= ' ServerError';
    }
    $Class .= ' ' . $Size;
    my $String = "<input type=\"text\" name=\"$Param{Key}\" class=\"$Class\" ";

    if ($ItemId) {
        $String .= "id=\"$ItemId\" ";
    }

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
        
        # transform ascii to html
        $Value = $LayoutObject->Ascii2Html(
            Text           => $Value,
            HTMLResultMode => 1,
        );
    }

    $String .= "value=\"$Value\" ";

    # add maximum length
    if ( $Param{Item}->{Input}->{MaxLength} ) {
        $String .= "maxlength=\"$Param{Item}->{Input}->{MaxLength}\" ";
    }

    $String .= '/> ';

    return $String;
}

##################SNIP#################################