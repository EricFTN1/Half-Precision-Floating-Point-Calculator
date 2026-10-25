
OnOffToggle OnOffToggle_inst
(
	.OnOff(OnOff_sig) ,	// input  OnOff_sig
	.IN(IN_sig) ,	// input  IN_sig
	.OUT(OUT_sig) 	// output  OUT_sig
);

defparam OnOffToggle_inst.ON = 'b1;
defparam OnOffToggle_inst.OFF = 'b0;
