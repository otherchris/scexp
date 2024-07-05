s.boot;
s.reboot;


a = Synth("myGuy", [\offset, 1, \freq, 75]);
{a.set(\gate, 1); SystemClock.sched(0.1, a.set(\gate, 0));}.value;
a.set(\gate, 0);

Pbind(\instrument, "myGuy", \degree, Pseq([0,2,5,8], inf)).play;
a.free;


