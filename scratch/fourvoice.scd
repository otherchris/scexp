MIDIIn.connectAll;

g = {Out.ar(1, BLowPass.ar(in: In.ar(56), freq: MouseY.kr(10, 5000), rq: MouseX.kr(0.0, 1.0)))}.play;

f = {Out.ar(0, BLowPass.ar(in: In.ar(55), freq: MouseY.kr(10, 5000), rq: MouseX.kr(0.0, 1.0)))}.play;

(
SynthDef("myGuy",
  { 
  
    arg mul1 = 0.1, mul2 = 0.1, freq = 110, offset = 0.0;
    var env = Env.perc(level: 0.5).kr(2, doneAction: 2);
    var snd1 = Saw.ar(freq, mul: 0.2);
    var snd2 = Saw.ar(freq + offset , mul: 0.2);
    Out.ar(55, snd1);
    Out.ar(56, snd2);
  }
).add;
)

z = {
  arg boffset = 10;
  Pbind(\instrument, "myGuy", \degree, Pseq([0, 3, 5], inf), \offset, boffset)
}.play

MIDIdef.cc(\mul1, {
  arg x;
  z.set(\mul1, x / 127.0)
}, 102);

MIDIdef.cc(\mul2, {
  arg x;
  z.set(\mul2, x / 127.0)
}, 103);

MIDIdef.cc(\offset, {
  arg x;
  x.postln;
  z.set(\offset, x / 12.0)
}, 1);

a.free;
a.play;
