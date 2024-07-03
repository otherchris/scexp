
(
SynthDef("beeper", {
  arg freq = 200, offset = 1;
  var env = Env.perc(attackTime: 0.1, releaseTime: 0.1, level: 0.5).kr(0.1, doneAction: 2);
  Out.ar(0, Mix.new([SinOsc.ar([freq, freq + offset], mul: 0.4), SinOsc.ar(400)]));
}).add;

)
