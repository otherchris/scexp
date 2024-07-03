s.boot;
s.reboot;

(
  SynthDef("beeper", {
    arg freq = 200, offset = 1;
    var env = Env.new([0, 0.6, 0], [0.1, 0.1]).kr(0.3, doneAction: 2);
    Out.ar(0, SinOsc.ar([freq, freq + offset], mul: env));
  }).add;
)

(
  t = TempoClock.new;

  t.tempo = 4;

  t.sched(0, {Synth("beeper", [\freq, 100]); 2});
  t.sched(1, {Synth("beeper", [\freq, 133, "offset", 5]); 4});
  t.sched(3, {Synth("beeper", [\freq, 185]); 4});

)
(
  z = {
    arg size = 8, step = 1;
    (1..size).postln;
    p = Pbind(
      \instrument, "beeper", 
      \degree, Pseq((1..size), inf), 
      \offset, Pseq([1, 1, 1, 1, 200], inf), 
      \dur, 0.2
    ).play;
  }
)

b = 5;
(1..b).postln;
z.play;
