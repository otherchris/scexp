s.boot;
s.reboot;

s.record;
s.record.stopRecording();
thisProcess.platform.recordingsDir;

a = Synth("windinst", [freq: 50, rqMax: 0.05, amp: 3, release: 10]);
b = Synth("windinst", [freq: 100]);
c = Synth("windinst", [freq: 400, rqMax: 0.02, rqFreq: 0.05]);
d = Synth("windinst", [freq: 200, rqFreq: 0.05]);
e = Synth("windinst", [freq: 250]);
f = Synth("windinst", [freq: 275]);
i = Synth("windinst", [freq: 550]);
g = Synth("windinst", [freq: 800, rqFreq: 1, rqMax: 0.007]);
h = Synth("windinst", [freq: 600, rqFreq: 2, rqMax: 0.002]);


a.set(\amp, 1.5);
a.set(\gate, 0);
b.set(\gate, 0);
c.set(\gate, 0);
d.set(\gate, 0);
e.set(\gate, 0);
f.set(\gate, 0);
g.set(\gate, 0);
h.set(\gate, 0);
i.set(\gate, 0);




