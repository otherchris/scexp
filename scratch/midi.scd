MIDIIn.connectAll;

MIDIFunc.trace(true);
MIDIFunc.trace(false);

(var logNotes; logNotes = MIDIFunc.noteOn({ | veloc, num, chan, src | [ "veloc:", veloc, "num":num, "chan":chan, "src":src ].postln; })) logNotes.free;

a = {arg midiNote;
Splay.ar(Saw.ar(midiNote * 10))
}
.play;

MIDIdef.cc(\someCC, {
  arg x, y;
  a.set(\midiNote, x)
});

a.free;
