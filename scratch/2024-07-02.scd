s.boot;
s.reboot;

MIDIIn.connectAll;
MIDIFunc.trace(true);
MIDIFunc.trace(false);

a = {Out.ar(55, BrownNoise.ar())}.play;
b = {Out.ar(56, BrownNoise.ar())}.play;

  SynthDef("bandy", {
    arg freq = 330, rq = 0.5;
    Pan2.ar(in: BPF.ar(in: BrownNoise.ar(), freq: freq, rq: rq));
  }).add;

  z = Synth("bandy");



(
SynthDef("windinst",  {
  arg freq = 400, rq = 0.03, gate = 1;
  var env = Env.asr(0.5, 0.8, 2).kr(1.4, gate);
  Out.ar(0, 
    BPF.ar(
      in: [BrownNoise.ar(mul: env), BrownNoise.ar(mul: env)],
      freq: freq, 
      rq: SinOsc.kr(freq:0.025, mul:0.01, add: 0.0101), 
    )
  )
}).add;
)
z = Synth("windinst");
z.free;

(
Pbind(
  \instrument, \windinst, 
  \degree, Pseq([-8, 0, -10, -12, -11, -10, 0], inf), 
  \dur, Pseq([1, 2, 1, 0.5, 0.5, 1, 1], inf), 
  \legato, 1.5,
).play;
)

s.record;
thisProcess.platform.recordingsDir;



MIDIdef.cc(\freq, {
  arg x;
  z.set(\freq, x * 10.0)
}, 102);

MIDIdef.cc(\rq, {
  arg x;
  z.set(\rq, x / 127.0)
}, 103);


z.free;
