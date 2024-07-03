s.boot;
s.reboot;

MIDIIn.connectAll;
MIDIFunc.trace(true);
MIDIFunc.trace(false);
(
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

    var oscs = {|i| Saw.ar(fundamental * (2*i + 1), mul: SinOsc.kr((i + 1)/2) * (muls[i + 4] / (i + 1)))}!4;
    var mix = Mix.new(oscs);
    Out.ar(0, BLowPass.ar(in: mix, freq: filt, rq: q));
    Out.ar(1, BLowPass.ar(in: mix, freq: filt, rq: q));
 }).add;

 a = Synth("harms");


 MIDIdef.cc(\mul1, {
   arg x;
   (x * 10).postln;
   a.set(\filt, x * 10)
 }, 1);

 MIDIdef.cc(\mul2, {
   arg x;
   (x / 127).postln;
   a.set(\q, x / 127.0)
 }, 103);
 
 MIDIdef.cc(\mul3, {
   arg x;
   a.set(\mul3, x / 127.0)
 }, 104);
 
 MIDIdef.cc(\mul4, {
   arg x;
   a.set(\mul4, x / 127.0)
 }, 105);
 
 MIDIdef.cc(\mul5, {
   arg x;
   a.set(\mul5, x / 127.0)
 }, 106);
 
 MIDIdef.cc(\mul6, {
   arg x;
   a.set(\mul6, x / 127.0)
 }, 107);
 
 MIDIdef.cc(\mul7, {
   arg x;
   a.set(\mul7, x / 127.0)
 }, 108);

 MIDIdef.cc(\mul8, {
   arg x;
   a.set(\mul8, x / 127.0)
 }, 109);

 





 = Synth("harms");
.free;
