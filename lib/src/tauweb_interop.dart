/*
 * Copyright 2024 Canardoux.
 *
 * This file is part of the τ project.
 *
 * τ is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 (GPL3), as published by
 * the Free Software Foundation.
 *
 * τ is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with τ.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:js_interop';
import 'dart:typed_data';
import 'tauweb_audio.dart' as j;
import 'package:web/web.dart' as w;
import 'dart:js_interop' as p;

/// Internal use by Tauweb.
/// @nodoc
class Interop {
  JSPromise<JSObject>? totofut;
  static final Interop _singleton = Interop._internal();

  factory Interop() {
    return _singleton;
  }

  Interop._internal();

  JSArray<JSNumber> jsArrayNumber(List<num> listNum) {
    List<JSNumber> r = [];
    for (var v in listNum) {
      r.add(v.toJS);
    }
    return r.toJS;
  }

  JSArray<JSNumber> jsArrayInt(List<int> listInt) {
    List<JSNumber> r = [];
    for (var v in listInt) {
      r.add(v.toJS);
    }
    return r.toJS;
  }

  JSArray<JSFloat32Array> jsArrayFloats(List<Float32List> listFloats) {
    List<JSFloat32Array> r = [];
    for (var v in listFloats) {
      // v is a Float32List
      //var vv = v.toJS; // vv is a JSFloat32Array
      r.add(v.toJS);
    }
    /*
          List<JSNumber> r = [];
          for (var v in listInt) {
            r.add(v.toJS);
          }
           */
    return r.toJS;
  }

  List<int> listNumInt(JSArray<JSNumber> j) {
    List<int> r = [];
    List<JSNumber> l = j.toDart;
    for (int i = 0; i < l.length; ++i) {
      r.add(l[i].toDartInt);
    }
    return r;
  }

  List<num> listNum(JSArray<JSNumber> j) {
    List<num> r = [];
    List<JSNumber> l = j.toDart;
    for (int i = 0; i < l.length; ++i) {
      r.add(l[i].toDartDouble);
    }
    return r;
  }

  Float32List listFloat32(JSArray<JSNumber> j) {
    Float32List r = Float32List(0);
    List<JSNumber> l = j.toDart;
    for (int i = 0; i < l.length; ++i) {
      r.add(l[i].toDartDouble);
    }
    return r;
  }

  List<Float32List> listFloat32List(List<JSAny> j) {
    List<Float32List> r = [];
    for (int i = 0; i < j.length; ++i) {
      var x = j[i];
      //var y = (x as JSArray).toDart;
      var z = x as List<JSNumber>;
      var zz = z as Float32List;
      r.add(zz);
      /*
      Float32List d = Float32List(0);
      for (int j = 0; j < z.length; ++j)
        {
          var zz = z[j];
          var zzz = zz.toDartDouble;
          d.add(zzz);
        }
      //var d = listFloat32(y);
      r.add( d);

       */
    }

    return r;
  }

  // The Audio Context
  late j.AudioContext audioCtx;

  // The three nodes
  j.MediaElementAudioSourceNode? source;
  j.StereoPannerNode? pannerNode;
  j.AudioDestinationNode? dest;

  w.HTMLAudioElement? audioElt;

  void toto() {
    audioElt = w.HTMLAudioElement();
    audioElt!.src = 'https://flutter-sound.canardoux.xyz/extract/05.mp3';

    audioCtx = j.AudioContext();
    dest = audioCtx.destination;
    source = audioCtx.createMediaElementSource(audioElt!);
    dest = audioCtx.destination;
    pannerNode = audioCtx.createStereoPanner();
    source!.connect(pannerNode!);
    pannerNode!.connect(dest!);

    //audioElt!.src = 'https://flutter-sound.canardoux.xyz/extract/05.mp3';
    //audioElt.crossorigin = 'anonymous';
    //MediaElementAudioSourceOptions opt = Tau().newMediaElementAudioSourceOptions(mediaElement: audioElt);
    //opt.mediaElement = audioElt;
    //source = Tau().newMediaElementAudioSourceNode(audioCtx, opt);
    //source =  audioCtx.createMediaElementSource(audioElt!);
    //pannerNode!.pan.value = pannerValue;
    //source!.connect(pannerNode!);
    //pannerNode!.connect(dest!);

    audioElt!.play();
  }
}
