s.boot;
s.reboot;


a = Synth("myGuy", [\offset, 1, \freq, 75]);
{a.set(\gate, 1); SystemClock.sched(0.1, a.set(\gate, 0));}.value;
a.set(\gate, 0);

Pbind(\instrument, "myGuy", \degree, Pseq([0,2,5,8], inf)).play;
a.free;

(
  SynthDef("cicada",
    {
      arg freq = 80, filterCut = 100, pulseFreq = 10, gate = 0;
      var pulse = Pulse.ar(freq: freq, width: 0.1);
      var hpf = HPF.ar(pulse, freq: filterCut);
      var pulseFreqEnv = Env.asr(0.01, 0.9, 5).kr(0, gate);
      var gainEnv = Env.asr(0.01, 0.5, 7).kr(2, gate);
      
      Out.ar(0, Pan2.ar(hpf, level: LFSaw.kr(freq: pulseFreq * pulseFreqEnv, mul: gainEnv, add: gainEnv * 0.5001)));
    }
  ).add;
)
(
b = Synth("cicada", [filterCut: 500, freq: 100]);

MIDIdef.noteOn(\noteOn, {
  arg vel, note;
  b.set(\freq, note.midicps);
  b.set(\gate, 1);
});

MIDIdef.noteOff(\noteOff, {
  arg vel, note;
  b.set(\gate, 0);
});
  )

b.set(\gate, 1);
b.set(\gate, 0);
b.free;
