{SinOsc.ar(freq: MouseX.kr(300, 2500), mul: MouseY.kr(0, 1))}.play;
// Run one line at a time (don't stop the sound in between):
a = { Saw.ar(LFNoise2.kr(8).range(1000, 2000), mul: 0.2) }.play;
b = { Saw.ar(LFNoise2.kr(7).range(100, 1000), mul: 0.2) }.play;
c = { Saw.ar(LFNoise0.kr(15).range(2000, 3000), mul: 0.1) }.play;
// Stop synths individually:
a.free;
b.free;
c.free;

f = {Out.ar(0, BPF.ar(in: In.ar(55), freq: MouseY.kr(1000, 5000), rq: 0.1))}.play;

n = {Out.ar(55, WhiteNoise.ar(0.5))}.play;.

a = {Out.ar(0, Saw.ar(freq: [440, 570], mul: Line.kr(0, 1, 10)))}.play;
a.free;

a = {Out.ar(0, SinOsc.ar(freq: [800, 880], mul: LFPulse.ar(2)))}.play;

a = { SinOsc.ar([100, 300, 500, 700, 900], mul: 0.1)}.play;
a.free;

b = { Mix(SinOsc.ar([100, 300, 500, 700, 900], mul: 0.1))}.play;
b.free;

c = { Splay.ar(SinOsc.ar([100, 300, 500, 700, 900], mul: 0.1))}.play;
c.free;

(
d = {
  arg fundamental =110;
  var harmonics = [1,3,4,5,7,8,9];
  var snd = BPF.ar(
    in: SinOsc.ar(32, LFPulse.ar(harmonics, width: 0.1)),
    freq: harmonics * fundamental,
      rq: 0.01,
      mul: 20);
  Splay.ar(snd);
}.play;
)
d.set(\fundamental, 100);
d.free;

~buf1 = Buffer.read(s, "./sausage.wav");
f = {PlayBuf.ar(2, ~buf1, MouseY.kr(0.5, 3), loop: 1) * 0.1}.play;
f = {PlayBuf.ar(2, ~buf1, MouseY.kr(0.5, 3), loop: 1) * 0.1}.play;
f.set(\amp, 0.81);
f.free;

s.plotTree;

{PinkNoise.ar(Env.perc.kr(doneAction: 2))}.play;

