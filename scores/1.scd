// Start the performance
(
  v = [
    Dictionary[\name -> "0", \synth -> Synth("brownwind", [freq: 50, rqMax: 0.05, amp: 3, release: 10])],
    Dictionary[\name -> "1", \synth -> Synth("brownwind", [freq: 100])],
    Dictionary[\name -> "2", \synth -> Synth("brownwind", [freq: 400, rqMax: 0.02, rqFreq: 0.05])],
    Dictionary[\name -> "3", \synth -> Synth("whitewind", [freq: 200, rqFreq: 0.05])],
    Dictionary[\name -> "4", \synth -> Synth("pinkwind", [freq: 250, rqMax: 0.005, amp: 1.1])],
    Dictionary[\name -> "5", \synth -> Synth("pinkwind", [freq: 275, rqMax: 0.005, amp: 1.1])],
    Dictionary[\name -> "6", \synth -> Synth("pinkwind", [freq: 550, rqMax: 0.005, amp: 1.1])],
    Dictionary[\name -> "7", \synth -> Synth("brownwind", [freq: 800, rqFreq: 1, rqMax: 0.007])],
    Dictionary[\name -> "8", \synth -> Synth("brownwind", [freq: 600, rqFreq: 2, rqMax: 0.002])]
  ];
  {|i| v[i][\synth].set(\gate, 0) }!9;

  t = SystemClock.seconds;
  // s.record;

  a = { arg index;
    "on: %".format(index).postln;
    v[index][\synth].set(\gate, 1);
  };
  b = { arg index;
    "off: %".format(index).postln;
    v[index][\synth].set(\gate, 0);
  };

  SystemClock.sched(5.806621167, {a.value(1)});
  SystemClock.sched(5.806621167, {a.value(2)});
  SystemClock.sched(5.806621167, {a.value(3)});
  SystemClock.sched(36.446106042, {a.value(4)});
  SystemClock.sched(38.813945042, {a.value(5)});
  SystemClock.sched(46.282725959, {b.value(5)});
  SystemClock.sched(74.076491084, {a.value(5)});
  SystemClock.sched(78.316364125, {a.value(6)});
  SystemClock.sched(98.349836209, {b.value(6)});
  SystemClock.sched(125.538399375, {a.value(6)});
  SystemClock.sched(129.216774625, {b.value(7)});
  SystemClock.sched(132.390588417, {a.value(7)});
  SystemClock.sched(136.715323542, {a.value(8)});
  SystemClock.sched(140.859415625, {a.value(0)});
  SystemClock.sched(177.091899, {b.value(0)});
  SystemClock.sched(182.483350875, {b.value(7)});
  SystemClock.sched(186.441910292, {b.value(6)});
  SystemClock.sched(187.527308167, {b.value(8)});
  SystemClock.sched(191.042462542, {b.value(1)});
  SystemClock.sched(192.580414125, {b.value(2)});
  SystemClock.sched(195.391112542, {b.value(5)});
  SystemClock.sched(198.936105375, {b.value(4)});
  SystemClock.sched(210.996196125, {b.value(3)});
)


b.value(1);

s.stopRecording;
s.reboot;
