s.boot;
s.reboot;

// Start the performance
(
  var path = "~/code/projects/scexp/log.txt".standardizePath;
  f = File(path, "w");
  v = [
    Dictionary[\name -> "0", \synth -> Synth("brownwind", [freq: 50, rqMax: 0.05, amp: 3, release: 10])],
    Dictionary[\name -> "1", \synth -> Synth("brownwind", [freq: 100])],
    Dictionary[\name -> "2", \synth -> Synth("brownwind", [freq: 400, rqMax: 0.02, rqFreq: 0.05])],
    Dictionary[\name -> "3", \synth -> Synth("brownwind", [freq: 200, rqFreq: 0.05])],
    Dictionary[\name -> "4", \synth -> Synth("brownwind", [freq: 250])],
    Dictionary[\name -> "5", \synth -> Synth("brownwind", [freq: 275])],
    Dictionary[\name -> "6", \synth -> Synth("brownwind", [freq: 550])],
    Dictionary[\name -> "7", \synth -> Synth("brownwind", [freq: 800, rqFreq: 1, rqMax: 0.007])],
    Dictionary[\name -> "8", \synth -> Synth("brownwind", [freq: 600, rqFreq: 2, rqMax: 0.002])]
  ];
  {|i| v[i][\synth].set(\gate, 0) }!9;

  s.record;  
  t = SystemClock.seconds;

  a = { arg index;
    v[index][\synth].set(\gate, 1);
    f.write("on,%,%\n".format(index, SystemClock.seconds - t));
  };
  b = { arg index;
    v[index][\synth].set(\gate, 0);
    f.write("off,%,%\n".format(index, SystemClock.seconds - t));
  };
)

// Control the performance 
a.value(0);
a.value(1);
a.value(2);
a.value(3);
a.value(4);
a.value(5);
a.value(6);
a.value(7);
a.value(8);

b.value(0);
b.value(1);
b.value(2);
b.value(3);
b.value(4);
b.value(5);
b.value(6);
b.value(7);
b.value(8);

// End the performance
(
  s.stopRecording;
  f.close;
)






f.close;


func.value("another msg");

)
var startTime = SystemClock.seconds;
a = {
  logfile.write("a on, %\n".format(SystemClock.seconds - startTime));
  "called".postln;
}

a.play;



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

)
