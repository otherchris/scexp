(
  SynthDef("beeper", {
    arg freq = 200, offset = 1;
    var env = Env.perc(0.1, 0.1, 0.5).kr(0.1, doneAction: 2);
    Out.ar(0, Mix.new([SinOsc.ar([freq, freq + offset], mul: 0.4), SinOsc.ar(400)]));
  }).add;

  SynthDef("harms", {
    arg 
      fundamental = 100,
      mul1 = 0,
      mul2 = 0,
      mul3 = 0,
      mul4 = 0,
      mul5 = 0,
      mul6 = 0,
      mul7 = 0,
      mul8 = 0,
      filt = 1000,
      q = 0;
    var muls = [mul1, mul2, mul3, mul4, mul5, mul6, mul7, mul8];

    var oscs = { |i| 
      Saw.ar(
        fundamental * (2*i + 1), 
        mul: SinOsc.kr((i + 1)/2) * (muls[i + 4] / (i + 1))
      )
    }!4;
    var mix = Mix.new(oscs);
    Out.ar(0, BLowPass.ar(in: mix, freq: filt, rq: q));
    Out.ar(1, BLowPass.ar(in: mix, freq: filt, rq: q));
  }).add;

  SynthDef("myGuy",
    { 
      arg mul1 = 0.1, mul2 = 0.1, freq = 110, offset = 0.0;
      var env = Env.perc(level: 0.5).kr(2, doneAction: 2);
      var snd1 = Saw.ar(freq, mul: 0.2);
      var snd2 = Saw.ar(freq + offset , mul: 0.2);
      Out.ar(55, snd1);
      Out.ar(56, snd2);
  }).add;

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
