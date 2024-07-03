MIDIIn.connectAll;
(
SynthDef("myGuy", {
  arg freq = 200, offset = 1;
  // var env = Env.perc(level: 0.5).kr(2, doneAction: 2);
  Out.ar(0, Mix.new([SinOsc.ar([freq, freq + offset], mul: 0.4), SinOsc.ar(400)]));
}).add;

)

s.reboot;
a = Synth("myGuy", ["freq", 100, "offset", 10]);
a.set("offset", 1);
a.set("freq", 100);

MIDIdef.cc(\someCC, {
  arg x, y;
  x.postln;
  a.set(\offset, x)
});

Pbind(\instrument, "myGuy", \degree, Pseq([[0,5], [3,0], [5,3], [5,7]], inf)).play;
z = {
  arg boffset = 0;
  Pbind(\instrument, "myGuy", \degree, Pseq([0, 3, 5], inf), \offset, boffset)
}.play

{SinOsc.ar([110,111], mul: 0.5)}.play;

