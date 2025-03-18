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

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// API docs from [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web).
// Attributions and copyright licensing by Mozilla Contributors is licensed
// under [CC-BY-SA 2.5](https://creativecommons.org/licenses/by-sa/2.5/.

// Generated from Web IDL definitions.

// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:typed_data';
import 'package:etau/etau.dart' as t;
import 'tauweb_audio.dart' as j;
//import 'tauweb_implementation.dart' as i;
import 'tauweb_interop.dart';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'package:web/web.dart' as w;

typedef TauSampleRate = double;
typedef TauTime = int;

typedef BitrateMode = String;
typedef RecordingState = String;

// ------------------------------------------------------------------------------------------------------------------

abstract class BaseAudioContext implements t.BaseAudioContext {
  j.BaseAudioContext getDelegate();
  t.EventHandler _onStateChange = () {};

  @override
  AnalyserNode createAnalyser() =>
      AnalyserNode.fromDelegate(getDelegate().createAnalyser());

  @override
  BiquadFilterNode createBiquadFilter() =>
      BiquadFilterNode.fromDelegate(getDelegate().createBiquadFilter());

  @override
  AudioBuffer createBuffer(
    int numberOfChannels,
    int length,
    TauSampleRate sampleRate,
  ) =>
      AudioBuffer.fromDelegate(
          getDelegate().createBuffer(numberOfChannels, length, sampleRate));

  @override
  AudioBufferSourceNode createBufferSource() =>
      AudioBufferSourceNode.fromDelegate(getDelegate().createBufferSource());

  @override
  ChannelMergerNode createChannelMerger([int? numberOfInputs]) =>
      numberOfInputs == null
          ? ChannelMergerNode.fromDelegate(getDelegate().createChannelMerger())
          : ChannelMergerNode.fromDelegate(
              getDelegate().createChannelMerger(numberOfInputs));

  @override
  ChannelSplitterNode createChannelSplitter([int? numberOfOutputs]) =>
      numberOfOutputs == null
          ? ChannelSplitterNode.fromDelegate(
              getDelegate().createChannelSplitter())
          : ChannelSplitterNode.fromDelegate(
              getDelegate().createChannelSplitter(numberOfOutputs));

  @override
  ConstantSourceNode createConstantSource() =>
      ConstantSourceNode.fromDelegate(getDelegate().createConstantSource());

  @override
  ConvolverNode createConvolver() =>
      ConvolverNode.fromDelegate(getDelegate().createConvolver());

  @override
  DelayNode createDelay([num? maxDelayTime]) => maxDelayTime == null
      ? DelayNode.fromDelegate(getDelegate().createDelay())
      : DelayNode.fromDelegate(getDelegate().createDelay(maxDelayTime));

  @override
  DynamicsCompressorNode createDynamicsCompressor() =>
      DynamicsCompressorNode.fromDelegate(
          getDelegate().createDynamicsCompressor());

  @override
  GainNode createGain() => GainNode.fromDelegate(getDelegate().createGain());

  @override
  IIRFilterNode createIIRFilter(
    List<double> feedforward,
    List<double> feedback,
  ) =>
      IIRFilterNode.fromDelegate(getDelegate().createIIRFilter(
          Interop().jsArrayNumber(feedforward),
          Interop().jsArrayNumber(feedback)));

  @override
  OscillatorNode createOscillator() =>
      OscillatorNode.fromDelegate(getDelegate().createOscillator());

  @override
  PannerNode createPanner() =>
      PannerNode.fromDelegate(getDelegate().createPanner());

  @override
  PeriodicWave createPeriodicWave(
    t.TauArray<t.TauNumber> real,
    t.TauArray<t.TauNumber> imag, [
    t.PeriodicWaveConstraints? constraints,
  ]) =>
      constraints == null
          ? PeriodicWave.fromDelegate(getDelegate().createPeriodicWave(
              Interop().jsArrayNumber(real), Interop().jsArrayNumber(imag)))
          : PeriodicWave.fromDelegate(getDelegate().createPeriodicWave(
              Interop().jsArrayNumber(real),
              Interop().jsArrayNumber(imag),
              (constraints as PeriodicWaveConstraints).getDelegate()));

  @override
  ScriptProcessorNode createScriptProcessor([
    int? bufferSize,
    int? numberOfInputChannels,
    int? numberOfOutputChannels,
  ]) =>
      bufferSize == null
          ? ScriptProcessorNode.fromDelegate(
              getDelegate().createScriptProcessor())
          : numberOfInputChannels == null
              ? ScriptProcessorNode.fromDelegate(
                  getDelegate().createScriptProcessor(bufferSize))
              : numberOfOutputChannels == null
                  ? ScriptProcessorNode.fromDelegate(getDelegate()
                      .createScriptProcessor(bufferSize, numberOfInputChannels))
                  : ScriptProcessorNode.fromDelegate(getDelegate()
                      .createScriptProcessor(bufferSize, numberOfInputChannels,
                          numberOfOutputChannels));

  @override
  StereoPannerNode createStereoPanner() =>
      StereoPannerNode.fromDelegate(getDelegate().createStereoPanner());

  @override
  WaveShaperNode createWaveShaper() =>
      WaveShaperNode.fromDelegate(getDelegate().createWaveShaper());

  @override
  t.TauPromise<AudioBuffer> decodeAudioData(
    t.TauArrayBuffer audioData, [
    t.DecodeSuccessCallback? successCallback,
    t.DecodeErrorCallback? errorCallback,
  ]) =>
      getDelegate()
          .decodeAudioData(
              audioData.toJS, successCallback?.toJS, errorCallback?.toJS)
          .toDart
          .then((e) {
        return AudioBuffer.fromDelegate(e);
      });

  @override
  AudioDestinationNode get destination =>
      AudioDestinationNode.fromDelegate(getDelegate().destination);

  @override
  TauSampleRate get sampleRate => getDelegate().sampleRate;

  @override
  int get currentTime => getDelegate().currentTime.floor();

  @override
  AudioListener get listener =>
      AudioListener.fromDelegate(getDelegate().listener);

  @override
  t.AudioContextState get state => getDelegate().state;

  @override
  AudioWorklet get audioWorklet =>
      AudioWorklet.fromDelegate(getDelegate().audioWorklet);

  @override
  t.EventHandler get onstatechange => _onStateChange;

  @override
  set onstatechange(t.EventHandler value) {
    _onStateChange = value;
    getDelegate().onstatechange = value.toJS;
  }
}

// ------------------------------------------------------------------------------------------------------------------

class AudioContext extends BaseAudioContext implements t.AudioContext {
  j.AudioContext delegate;

  @override
  j.BaseAudioContext getDelegate() => delegate;

  /* ctor */ AudioContext.fromDelegate(this.delegate);
  /* ctor */ AudioContext([t.AudioContextOptions? contextOptions])
      : delegate = contextOptions == null
            ? j.AudioContext()
            : j.AudioContext((contextOptions as AudioContextOptions).delegate);

  @override
  AudioTimestamp getOutputTimestamp() =>
      AudioTimestamp.fromDelegate(delegate.getOutputTimestamp());

  @override
  t.TauPromise<t.TauAny?> resume() => delegate.resume().toDart;

  @override
  t.TauPromise<t.TauAny?> suspend() => delegate.suspend().toDart;

  @override
  t.TauPromise<t.TauAny?> close() => delegate.close().toDart;

  @override
  MediaElementAudioSourceNode createMediaElementSource(
          t.MediaElement mediaElement) =>
      MediaElementAudioSourceNode.fromDelegate(delegate
          .createMediaElementSource((mediaElement as MediaElement).delegate));

  @override
  MediaStreamAudioSourceNode createMediaStreamSource(
          t.MediaStream mediaStream) =>
      MediaStreamAudioSourceNode.fromDelegate(delegate
          .createMediaStreamSource((mediaStream as MediaStream).delegate));

  @override
  MediaStreamTrackAudioSourceNode createMediaStreamTrackSource(
          t.MediaStreamTrack mediaStreamTrack) =>
      MediaStreamTrackAudioSourceNode.fromDelegate(
          delegate.createMediaStreamTrackSource(
              (mediaStreamTrack as MediaStreamTrack).delegate));

  @override
  MediaStreamAudioDestinationNode createMediaStreamDestination() =>
      MediaStreamAudioDestinationNode.fromDelegate(
          delegate.createMediaStreamDestination());

  @override
  double get baseLatency => delegate.baseLatency;

  @override
  double get outputLatency => delegate.outputLatency;

  /// Tau:
  @override
  Future<void> setSinkId(String sinkId) =>
      (delegate.setSinkId(sinkId.toJS)).toDart;

// =================================================================================================
//                          Added specific to τ
// =================================================================================================

  @override
  void dispose() {}
}

// ------------------------------------------------------------------------------------------------------------------

class AudioContextOptions implements t.AudioContextOptions {
  j.AudioContextOptions delegate;
  /* ctor */ AudioContextOptions.fromDelegate(this.delegate);
  /* ctor */ AudioContextOptions({
    dynamic latencyHint, // t.TauAny? latencyHint,
    TauSampleRate? sampleRate,
    dynamic sinkId, // t.TauAny? sinkId,
    dynamic renderSizeHint, // t.TauAny? renderSizeHint,
  }) : delegate = sampleRate == null
            ? j.AudioContextOptions(
                latencyHint: latencyHint,
                sinkId: sinkId,
                renderSizeHint: renderSizeHint)
            : j.AudioContextOptions(
                latencyHint: latencyHint,
                sampleRate: sampleRate.toJS,
                sinkId: sinkId,
                renderSizeHint: renderSizeHint);

  @override
  t.TauAny get latencyHint => delegate.latencyHint;

  @override
  set latencyHint(dynamic /*t.TauAny*/ value) => delegate.latencyHint = value;

  @override
  TauSampleRate get sampleRate => delegate.sampleRate;

  @override
  set sampleRate(TauSampleRate value) => delegate.sampleRate = value;

  @override
  t.TauAny get sinkId => delegate.sinkId;

  @override
  set sinkId(dynamic /*t.TauAny*/ value) => delegate.sinkId = value;

  @override
  t.TauAny get renderSizeHint => delegate.renderSizeHint;

  @override
  set renderSizeHint(dynamic /*t.TauAny*/ value) =>
      delegate.renderSizeHint = value;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioSinkOptions implements t.AudioSinkOptions {
  j.AudioSinkOptions delegate;

  /* ctor */ AudioSinkOptions.fromDelegate(this.delegate);
  /* ctor */ AudioSinkOptions({required t.AudioSinkType type})
      : delegate = j.AudioSinkOptions(type: type);

  t.AudioSinkType get type => delegate.type;
  set type(t.AudioSinkType value) => delegate.type = value;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioTimestamp implements t.AudioTimestamp {
  j.AudioTimestamp delegate;

  /* ctor */ AudioTimestamp.fromDelegate(this.delegate);
  /* ctor */ AudioTimestamp({
    num? contextTime,
    t.TauHighResTimeStamp? performanceTime,
  }) : delegate = j.AudioTimestamp(
            contextTime: contextTime, performanceTime: performanceTime);

  @override
  int get contextTime => delegate.contextTime.floor();

  @override
  set contextTime(int value) => delegate.contextTime = value.toDouble();

  @override
  int get performanceTime => delegate.performanceTime.floor();

  @override
  set performanceTime(int value) => delegate.performanceTime = value.toDouble();
}

// ------------------------------------------------------------------------------------------------------------------

class OfflineAudioContext extends BaseAudioContext
    implements t.OfflineAudioContext {
  j.OfflineAudioContext delegate;

  @override
  j.BaseAudioContext getDelegate() => delegate;

  t.EventHandler _onComplete = () {};

  /* ctor */ OfflineAudioContext.fromDelegate(this.delegate);
  /* ctor */ OfflineAudioContext(
    dynamic
        contextOptionsOrNumberOfChannels, // t.TauAny contextOptionsOrNumberOfChannels,
    [
    int? length,
    TauSampleRate? sampleRate,
  ]) : delegate = length == null
            ? j.OfflineAudioContext(contextOptionsOrNumberOfChannels)
            : sampleRate == null
                ? j.OfflineAudioContext(
                    contextOptionsOrNumberOfChannels, length)
                : j.OfflineAudioContext(
                    contextOptionsOrNumberOfChannels, length, sampleRate);

  @override
  t.TauPromise<AudioBuffer> startRendering() =>
      delegate.startRendering().toDart.then((e) {
        return AudioBuffer.fromDelegate(e);
      });

  @override
  t.TauPromise<t.TauAny?> resume() => delegate.resume().toDart;

  @override
  t.TauPromise<t.TauAny?> suspend(num suspendTime) =>
      delegate.suspend(suspendTime).toDart;

  @override
  int get length => delegate.length;

  @override
  t.EventHandler get oncomplete => _onComplete;

  @override
  set oncomplete(t.EventHandler value) {
    _onComplete = value;
    getDelegate().onstatechange = value.toJS;
  }

// =================================================================================================
//                          Added specific to Tau
// =================================================================================================

  @override
  void dispose() {}
}

// ------------------------------------------------------------------------------------------------------------------

class OfflineAudioContextOptions implements t.OfflineAudioContextOptions {
  j.OfflineAudioContextOptions delegate;
  j.OfflineAudioContextOptions getDelegate() => delegate;

  /* ctor */ OfflineAudioContextOptions.fromDelegate(this.delegate);
  /* ctor */ OfflineAudioContextOptions({
    int? numberOfChannels,
    required int length,
    required TauSampleRate sampleRate,
    dynamic renderSizeHint, // t.TauAny? renderSizeHint,
  }) : delegate = j.OfflineAudioContextOptions(
          numberOfChannels: numberOfChannels,
          length: length,
          sampleRate: sampleRate,
          renderSizeHint: renderSizeHint,
        );

  @override
  int get numberOfChannels => delegate.numberOfChannels;

  @override
  set numberOfChannels(int value) => delegate.numberOfChannels = value;

  @override
  int get length => delegate.length;

  @override
  set length(int value) => delegate.length = value;

  @override
  TauSampleRate get sampleRate => delegate.sampleRate;

  @override
  set sampleRate(TauSampleRate value) => delegate.sampleRate = value;

  @override
  t.TauAny get renderSizeHint => delegate.renderSizeHint;

  @override
  set renderSizeHint(dynamic /*t.TauAny*/ value) =>
      delegate.renderSizeHint = value;
}

// ------------------------------------------------------------------------------------------------------------------

class OfflineAudioCompletionEvent implements t.OfflineAudioCompletionEvent {
  j.OfflineAudioCompletionEvent delegate;
  j.OfflineAudioCompletionEvent getDelegate() => delegate;

  /* ctor */ OfflineAudioCompletionEvent.fromDelegate(this.delegate);
  /* ctor */ OfflineAudioCompletionEvent(
    String type,
    t.OfflineAudioCompletionEventInit eventInitDict,
  ) : delegate = j.OfflineAudioCompletionEvent(
            type, (eventInitDict as OfflineAudioCompletionEventInit).delegate);

  @override
  AudioBuffer get renderedBuffer =>
      AudioBuffer.fromDelegate(delegate.renderedBuffer);
}

// ------------------------------------------------------------------------------------------------------------------

class OfflineAudioCompletionEventInit
    implements t.OfflineAudioCompletionEventInit {
  j.OfflineAudioCompletionEventInit delegate;
  j.OfflineAudioCompletionEventInit getDelegate() => delegate;

  /* ctor */ OfflineAudioCompletionEventInit.fromDelegate(this.delegate);
  /* ctor */ OfflineAudioCompletionEventInit({
    bool? bubbles,
    bool? cancelable,
    bool? composed,
    required t.AudioBuffer renderedBuffer,
  }) : delegate = j.OfflineAudioCompletionEventInit(
            bubbles: bubbles,
            cancelable: cancelable,
            composed: composed,
            renderedBuffer: (renderedBuffer as AudioBuffer).delegate);

  @override
  AudioBuffer get renderedBuffer =>
      AudioBuffer.fromDelegate(delegate.renderedBuffer);

  @override
  set renderedBuffer(t.AudioBuffer value) =>
      delegate.renderedBuffer = (value as AudioBuffer).delegate;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioBuffer implements t.AudioBuffer {
  j.AudioBuffer delegate;
  j.AudioBuffer getDelegate() => delegate;

  /* ctor */ AudioBuffer.fromDelegate(this.delegate);
  /* ctor */ AudioBuffer(t.AudioBufferOptions options)
      : delegate = j.AudioBuffer((options as AudioBufferOptions).delegate);

  @override
  t.TauFloat32Array getChannelData(int channel) =>
      delegate.getChannelData(channel).toDart;

  @override
  void copyFromChannel(
    t.TauFloat32Array destination,
    int channelNumber, [
    int? bufferOffset,
  ]) =>
      bufferOffset == null
          ? delegate.copyFromChannel(
              destination.toJS,
              channelNumber,
            )
          : delegate.copyFromChannel(
              destination.toJS,
              channelNumber,
              bufferOffset,
            );

  @override
  void copyToChannel(
    t.TauFloat32Array source,
    int channelNumber, [
    int? bufferOffset,
  ]) =>
      copyToChannel(source, channelNumber, bufferOffset);

  @override
  TauSampleRate get sampleRate => delegate.sampleRate;

  @override
  int get length => delegate.length;

  @override
  double get duration => delegate.duration;

  @override
  int get numberOfChannels => delegate.numberOfChannels;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioBufferOptions implements t.AudioBufferOptions {
  j.AudioBufferOptions delegate;
  j.AudioBufferOptions getDelegate() => delegate;

  /* ctor */ AudioBufferOptions.fromDelegate(this.delegate);
  /* ctor */ AudioBufferOptions({
    int? numberOfChannels,
    required int length,
    required TauSampleRate sampleRate,
  }) : delegate = j.AudioBufferOptions(
            numberOfChannels: numberOfChannels,
            length: length,
            sampleRate: sampleRate);

  @override
  int get numberOfChannels => delegate.numberOfChannels;

  @override
  set numberOfChannels(int value) => delegate.numberOfChannels = value;

  @override
  int get length => delegate.length;

  @override
  set length(int value) => delegate.length = value;

  @override
  TauSampleRate get sampleRate => delegate.sampleRate;

  @override
  set sampleRate(TauSampleRate value) => delegate.sampleRate = value;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class AudioNode implements t.AudioNode {
  j.AudioNode getDelegate();

  @override
  t.AudioNode connect(
    // !!!! The DestinationParam case is not handled
    t.AudioNode destinationNode, // t.TauAny? destinationNodeOrDestinationParam
    [
    int? output,
    int? input,
  ]) {
    output == null
        ? getDelegate().connect((destinationNode as AudioNode).getDelegate())
        : input == null
            ? getDelegate().connect(
                (destinationNode as AudioNode).getDelegate(),
                output,
              )
            : getDelegate().connect(
                (destinationNode as AudioNode).getDelegate(), output, input);
    return destinationNode;
  }

  @override
  void connectParam(
    t.AudioParam
        destinationParam, //TauObject destinationNodeOrDestinationParam,
    [
    int? output,
    int? input,
  ]) {
    output == null
        ? getDelegate().connect((destinationParam as AudioParam).getDelegate())
        : input == null
            ? getDelegate().connect(
                (destinationParam as AudioParam).getDelegate(),
                output,
              )
            : getDelegate().connect(
                (destinationParam as AudioParam).getDelegate(), output, input);
  }

  @override
  void disconnect([
    // !!!! The DestinationParamOrOutput case is not handled
    t.AudioNode?
        destinationNodeOrDestinationParamOrOutput, // t.TauAny? destinationNodeOrDestinationParamOrOutput,
    int? output,
    int? input,
  ]) =>
      output == null
          ? getDelegate().disconnect(
              (destinationNodeOrDestinationParamOrOutput as AudioNode)
                  .getDelegate())
          : input == null
              ? getDelegate().disconnect(
                  (destinationNodeOrDestinationParamOrOutput as AudioNode)
                      .getDelegate(),
                  output,
                )
              : getDelegate().disconnect(
                  (destinationNodeOrDestinationParamOrOutput as AudioNode)
                      .getDelegate(),
                  output,
                  input);

  @override
  void disconnectParam(
    t.AudioParam destinationParam, [
    int? output,
    int? input,
  ]) =>
      output == null
          ? getDelegate()
              .disconnect((destinationParam as AudioParam).getDelegate())
          : input == null
              ? getDelegate().disconnect(
                  (destinationParam as AudioParam).getDelegate(),
                  output,
                )
              : getDelegate().disconnect(
                  (destinationParam as AudioParam).getDelegate(),
                  output,
                  input);

  @override
  BaseAudioContext get context =>
      AudioContext.fromDelegate(getDelegate().context as j.AudioContext);

  @override
  int get numberOfInputs => getDelegate().numberOfInputs;

  @override
  int get numberOfOutputs => getDelegate().numberOfOutputs;

  @override
  int get channelCount => getDelegate().channelCount;

  @override
  set channelCount(int value) => getDelegate().channelCount = value;

  @override
  t.ChannelCountMode get channelCountMode => getDelegate().channelCountMode;

  @override
  set channelCountMode(t.ChannelCountMode value) =>
      getDelegate().channelCountMode = value;

  @override
  t.ChannelInterpretation get channelInterpretation =>
      getDelegate().channelInterpretation;

  @override
  set channelInterpretation(t.ChannelInterpretation value) =>
      getDelegate().channelInterpretation = value;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class AudioNodeOptions implements t.AudioNodeOptions {
  j.AudioNodeOptions getDelegate();

  @override
  int get channelCount => getDelegate().channelCount;

  @override
  set channelCount(int value) => getDelegate().channelCount = value;

  @override
  t.ChannelCountMode get channelCountMode => getDelegate().channelCountMode;

  @override
  set channelCountMode(t.ChannelCountMode value) =>
      getDelegate().channelCountMode = value;

  @override
  t.ChannelInterpretation get channelInterpretation =>
      getDelegate().channelInterpretation;

  @override
  set channelInterpretation(t.ChannelInterpretation value) =>
      getDelegate().channelInterpretation = value;
}

class AudioNodeOptionsImp extends AudioNodeOptions {
  j.AudioNodeOptions delegate;

  @override
  j.AudioNodeOptions getDelegate() => delegate;

  /* ctor */ AudioNodeOptionsImp.fromDelegate(this.delegate);
  /* ctor */ AudioNodeOptionsImp({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
  }) : delegate = j.AudioNodeOptions(
            channelCount: channelCount,
            channelCountMode: channelCountMode,
            channelInterpretation: channelInterpretation);

  @override
  int get channelCount => delegate.channelCount;

  @override
  set channelCount(int value) => delegate.channelCount = value;

  @override
  t.ChannelCountMode get channelCountMode => delegate.channelCountMode;

  @override
  set channelCountMode(t.ChannelCountMode value) =>
      delegate.channelCountMode = value;

  @override
  t.ChannelInterpretation get channelInterpretation =>
      delegate.channelInterpretation;

  @override
  set channelInterpretation(t.ChannelInterpretation value) =>
      delegate.channelInterpretation = value;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioParam implements t.AudioParam {
  j.AudioParam delegate;
  j.AudioParam getDelegate() => delegate;

  /* ctor */ AudioParam.fromDelegate(this.delegate);
  /* ctor */ AudioParam(j.AudioParam param) : delegate = param;

  @override
  AudioParam setValueAtTime(
    num value,
    num startTime,
  ) =>
      AudioParam(delegate.setValueAtTime(value, startTime));

  @override
  AudioParam linearRampToValueAtTime(
    num value,
    num endTime,
  ) =>
      AudioParam(delegate.linearRampToValueAtTime(value, endTime));

  @override
  AudioParam exponentialRampToValueAtTime(
    num value,
    num endTime,
  ) =>
      AudioParam(delegate.exponentialRampToValueAtTime(value, endTime));

  @override
  AudioParam setTargetAtTime(
    num target,
    num startTime,
    num timeConstant,
  ) =>
      AudioParam(delegate.setTargetAtTime(target, startTime, timeConstant));

  @override
  AudioParam setValueCurveAtTime(
    t.TauArray<t.TauNumber> values,
    num startTime,
    num duration,
  ) =>
      AudioParam(delegate.setValueCurveAtTime(
          Interop().jsArrayNumber(values), startTime, duration));

  @override
  AudioParam cancelScheduledValues(num cancelTime) =>
      AudioParam(delegate.cancelScheduledValues(cancelTime));

  @override
  AudioParam cancelAndHoldAtTime(num cancelTime) =>
      AudioParam(delegate.cancelAndHoldAtTime(cancelTime));

  @override
  double get value => delegate.value;

  @override
  set value(num value) => delegate.value = value;

  @override
  t.AutomationRate get automationRate => delegate.automationRate;

  @override
  set automationRate(t.AutomationRate value) => delegate.automationRate = value;

  @override
  double get defaultValue => delegate.defaultValue;

  @override
  double get minValue => delegate.minValue;

  @override
  double get maxValue => delegate.maxValue;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class AudioScheduledSourceNode extends AudioNode
    implements t.AudioScheduledSourceNode {
  t.EventHandler _onEnded = () {};

  @override
  j.AudioScheduledSourceNode getDelegate();

  @override
  void start([num? when]) =>
      when == null ? getDelegate().start() : getDelegate().start(when);

  @override
  void stop([num? when]) =>
      when == null ? getDelegate().stop() : getDelegate().stop(when);

  @override
  t.EventHandler get onended => _onEnded;

  @override
  set onended(t.EventHandler value) {
    _onEnded = value;
    getDelegate().onended = value.toJS;
  }
}

// ------------------------------------------------------------------------------------------------------------------

class AnalyserNode extends AudioNode implements t.AnalyserNode {
  j.AnalyserNode delegate;

  @override
  j.AnalyserNode getDelegate() => delegate;

  /* ctor */ AnalyserNode.fromDelegate(this.delegate);
  /* ctor */ AnalyserNode(
    t.BaseAudioContext context, [
    t.AnalyserOptions? options,
  ]) : delegate = options == null
            ? j.AnalyserNode((context as AudioContext).delegate)
            : j.AnalyserNode((context as AudioContext).delegate,
                (options as AnalyserOptions).delegate);

  @override
  void getFloatFrequencyData(t.TauFloat32Array array) =>
      delegate.getFloatFrequencyData(array.toJS);

  @override
  void getByteFrequencyData(t.TauUint8Array array) =>
      delegate.getByteFrequencyData(array.toJS);

  @override
  void getFloatTimeDomainData(t.TauFloat32Array array) =>
      delegate.getFloatTimeDomainData(array.toJS);

  @override
  void getByteTimeDomainData(t.TauUint8Array array) =>
      delegate.getByteTimeDomainData(array.toJS);

  @override
  int get fftSize => delegate.fftSize;

  @override
  set fftSize(int value) => delegate.fftSize = value;

  @override
  int get frequencyBinCount => delegate.frequencyBinCount;

  @override
  double get minDecibels => delegate.minDecibels;

  @override
  set minDecibels(num value) => delegate.minDecibels = value;

  @override
  double get maxDecibels => delegate.maxDecibels;

  @override
  set maxDecibels(num value) => maxDecibels = value;

  @override
  int get smoothingTimeConstant => delegate.smoothingTimeConstant.floor();

  @override
  set smoothingTimeConstant(num value) =>
      delegate.smoothingTimeConstant = value;
}

// ------------------------------------------------------------------------------------------------------------------

class AnalyserOptions extends AudioNodeOptions implements t.AnalyserOptions {
  j.AnalyserOptions delegate;

  @override
  j.AnalyserOptions getDelegate() => delegate;

  /* ctor */ AnalyserOptions.fromDelegate(this.delegate);
  /* ctor */ AnalyserOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    int? fftSize,
    num? maxDecibels,
    num? minDecibels,
    num? smoothingTimeConstant,
  }) : delegate = j.AnalyserOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          fftSize: fftSize,
          maxDecibels: maxDecibels,
          minDecibels: minDecibels,
          smoothingTimeConstant: smoothingTimeConstant,
        );

  @override
  int get fftSize => delegate.fftSize;

  @override
  set fftSize(int value) => delegate.fftSize = value;

  @override
  double get maxDecibels => delegate.maxDecibels;

  @override
  set maxDecibels(num value) => delegate.maxDecibels = value;

  @override
  double get minDecibels => delegate.minDecibels;

  @override
  set minDecibels(num value) => delegate.minDecibels = value;

  @override
  int get smoothingTimeConstant => delegate.smoothingTimeConstant.floor();

  @override
  set smoothingTimeConstant(int value) =>
      delegate.smoothingTimeConstant = value.toDouble();
}

// ------------------------------------------------------------------------------------------------------------------

class AudioBufferSourceNode extends AudioScheduledSourceNode
    implements t.AudioBufferSourceNode {
  j.AudioBufferSourceNode delegate;

  @override
  j.AudioBufferSourceNode getDelegate() => delegate;

  /* ctor */ AudioBufferSourceNode.fromDelegate(this.delegate);
  /* ctor */ AudioBufferSourceNode(
    t.BaseAudioContext context, [
    t.AudioBufferSourceOptions? options,
  ]) : delegate = options == null
            ? j.AudioBufferSourceNode((context as AudioContext).delegate)
            : j.AudioBufferSourceNode((context as AudioContext).delegate,
                (options as AudioBufferSourceOptions).delegate);

  @override
  void start([
    num? when,
    num? offset,
    num? duration,
  ]) =>
      when == null
          ? delegate.start()
          : offset == null
              ? delegate.start(
                  when,
                )
              : duration == null
                  ? delegate.start(
                      when,
                      offset,
                    )
                  : delegate.start(when, offset, duration);

  @override
  AudioBuffer? get buffer => delegate.buffer == null
      ? null
      : AudioBuffer.fromDelegate(delegate.buffer!);

  @override
  set buffer(t.AudioBuffer? value) =>
      delegate.buffer = (value as AudioBuffer?)?.delegate;

  @override
  AudioParam get playbackRate => AudioParam.fromDelegate(delegate.playbackRate);

  @override
  AudioParam get detune => AudioParam.fromDelegate(delegate.detune);

  @override
  bool get loop => delegate.loop;

  @override
  set loop(bool value) => delegate.loop = value;

  @override
  double get loopStart => delegate.loopStart;

  @override
  set loopStart(num value) => delegate.loopStart = value;

  @override
  double get loopEnd => delegate.loopEnd;

  @override
  set loopEnd(num value) => delegate.loopEnd = value;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioBufferSourceOptions implements t.AudioBufferSourceOptions {
  j.AudioBufferSourceOptions delegate;
  j.AudioBufferSourceOptions getDelegate() => delegate;

  /* ctor */ AudioBufferSourceOptions.fromDelegate(this.delegate);
  /* ctor */ AudioBufferSourceOptions({
    t.AudioBuffer? buffer,
    num? detune,
    bool? loop,
    num? loopEnd,
    num? loopStart,
    num? playbackRate,
  }) : delegate = j.AudioBufferSourceOptions(
          buffer: (buffer as AudioBuffer?)?.delegate,
          detune: detune,
          loop: loop,
          loopEnd: loopEnd,
          loopStart: loopStart,
          playbackRate: playbackRate,
        );

  @override
  AudioBuffer? get buffer => delegate.buffer == null
      ? null
      : AudioBuffer.fromDelegate(delegate.buffer!);

  @override
  set buffer(t.AudioBuffer? value) =>
      delegate.buffer = (value as AudioBuffer?)?.delegate;

  @override
  double get detune => delegate.detune;

  @override
  set detune(num value) => delegate.detune = value;

  @override
  bool get loop => delegate.loop;

  @override
  set loop(bool value) => delegate.loop = value;

  @override
  double get loopEnd => delegate.loopEnd;

  @override
  set loopEnd(num value) => delegate.loopEnd = value;

  @override
  double get loopStart => delegate.loopStart;

  @override
  set loopStart(num value) => delegate.loopStart = value;

  @override
  double get playbackRate => delegate.playbackRate;

  @override
  set playbackRate(num value) => delegate.playbackRate = value;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioDestinationNode extends AudioNode implements t.AudioDestinationNode {
  j.AudioDestinationNode delegate;

  @override
  j.AudioDestinationNode getDelegate() => delegate;

  /* ctor */ AudioDestinationNode.fromDelegate(this.delegate);

  @override
  int get maxChannelCount => delegate.maxChannelCount;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioListener implements t.AudioListener {
  j.AudioListener delegate;
  j.AudioListener getDelegate() => delegate;

  /* ctor */ AudioListener.fromDelegate(this.delegate);

  @override
  void setPosition(
    num x,
    num y,
    num z,
  ) =>
      delegate.setPosition(x, y, z);

  @override
  void setOrientation(
    num x,
    num y,
    num z,
    num xUp,
    num yUp,
    num zUp,
  ) =>
      delegate.setOrientation(x, y, z, xUp, yUp, zUp);

  @override
  AudioParam get positionX => AudioParam.fromDelegate(delegate.positionX);

  @override
  AudioParam get positionY => AudioParam.fromDelegate(delegate.positionY);

  @override
  AudioParam get positionZ => AudioParam.fromDelegate(delegate.positionZ);

  @override
  AudioParam get forwardX => AudioParam.fromDelegate(delegate.forwardX);

  @override
  AudioParam get forwardY => AudioParam.fromDelegate(delegate.forwardY);

  @override
  AudioParam get forwardZ => AudioParam.fromDelegate(delegate.forwardZ);

  @override
  AudioParam get upX => AudioParam.fromDelegate(delegate.upX);

  @override
  AudioParam get upY => AudioParam.fromDelegate(delegate.upY);

  @override
  AudioParam get upZ => AudioParam.fromDelegate(delegate.upZ);
}

// ------------------------------------------------------------------------------------------------------------------

class AudioProcessingEvent implements t.AudioProcessingEvent {
  j.AudioProcessingEvent delegate;
  j.AudioProcessingEvent getDelegate() => delegate;

  /* ctor */ AudioProcessingEvent.fromDelegate(this.delegate);
  /* ctor */ AudioProcessingEvent(
    String type,
    t.AudioProcessingEventInit eventInitDict,
  ) : delegate = j.AudioProcessingEvent(
            type, (eventInitDict as AudioProcessingEventInit).delegate);

  @override
  int get playbackTime => delegate.playbackTime.floor();

  @override
  AudioBuffer get inputBuffer => AudioBuffer.fromDelegate(inputBuffer.delegate);

  @override
  AudioBuffer get outputBuffer =>
      AudioBuffer.fromDelegate(outputBuffer.delegate);
}

// ------------------------------------------------------------------------------------------------------------------

class AudioProcessingEventInit implements t.AudioProcessingEventInit {
  j.AudioProcessingEventInit delegate;
  j.AudioProcessingEventInit getDelegate() => delegate;

  /* ctor */ AudioProcessingEventInit.fromDelegate(this.delegate);
  /* ctor */ AudioProcessingEventInit({
    bool? bubbles,
    bool? cancelable,
    bool? composed,
    required num playbackTime,
    required t.AudioBuffer inputBuffer,
    required t.AudioBuffer outputBuffer,
  }) : delegate = j.AudioProcessingEventInit(
          bubbles: bubbles,
          cancelable: cancelable,
          composed: composed,
          playbackTime: playbackTime,
          inputBuffer: (inputBuffer as AudioBuffer).delegate,
          outputBuffer: (outputBuffer as AudioBuffer).delegate,
        );

  @override
  int get playbackTime => delegate.playbackTime.floor();

  @override
  set playbackTime(num value) => delegate.playbackTime = value;

  @override
  AudioBuffer get inputBuffer => AudioBuffer.fromDelegate(delegate.inputBuffer);

  @override
  set inputBuffer(t.AudioBuffer value) =>
      delegate.inputBuffer = (value as AudioBuffer).delegate;

  @override
  AudioBuffer get outputBuffer =>
      AudioBuffer.fromDelegate(delegate.outputBuffer);

  @override
  set outputBuffer(t.AudioBuffer value) =>
      delegate.outputBuffer = (value as AudioBuffer).delegate;
}

// ------------------------------------------------------------------------------------------------------------------

class BiquadFilterNode extends AudioNode implements t.BiquadFilterNode {
  j.BiquadFilterNode delegate;

  @override
  j.BiquadFilterNode getDelegate() => delegate;

  /* ctor */ BiquadFilterNode.fromDelegate(this.delegate);
  /* ctor */ BiquadFilterNode(
    t.BaseAudioContext context, [
    t.BiquadFilterOptions? options,
  ]) : delegate = options == null
            ? j.BiquadFilterNode((context as BaseAudioContext).getDelegate())
            : j.BiquadFilterNode((context as BaseAudioContext).getDelegate(),
                (options as BiquadFilterOptions).delegate);

  @override
  void getFrequencyResponse(
    t.TauFloat32Array frequencyHz,
    t.TauFloat32Array magResponse,
    t.TauFloat32Array phaseResponse,
  ) =>
      delegate.getFrequencyResponse(
          frequencyHz.toJS, magResponse.toJS, phaseResponse.toJS);

  @override
  t.BiquadFilterType get type => delegate.type;

  @override
  set type(t.BiquadFilterType value) => delegate.type = value;

  @override
  AudioParam get frequency => AudioParam.fromDelegate(delegate.frequency);

  @override
  AudioParam get detune => AudioParam.fromDelegate(delegate.detune);

  @override
  AudioParam get Q => AudioParam.fromDelegate(delegate.Q);

  @override
  AudioParam get gain => AudioParam.fromDelegate(delegate.gain);
}

// ------------------------------------------------------------------------------------------------------------------

class BiquadFilterOptions extends AudioNodeOptions
    implements t.BiquadFilterOptions {
  j.BiquadFilterOptions delegate;

  @override
  j.BiquadFilterOptions getDelegate() => delegate;

  /* ctor */ BiquadFilterOptions.fromDelegate(this.delegate);
  /* ctor */ BiquadFilterOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    t.BiquadFilterType? type,
    num? Q,
    num? detune,
    num? frequency,
    num? gain,
  }) : delegate = j.BiquadFilterOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          type: type,
          Q: Q,
          detune: detune,
          frequency: frequency,
          gain: gain,
        );

  @override
  t.BiquadFilterType get type => delegate.type;

  @override
  set type(t.BiquadFilterType value) => delegate.type = value;

  @override
  double get Q => delegate.Q;

  @override
  set Q(num value) => delegate.Q = value;

  @override
  double get detune => delegate.detune;

  @override
  set detune(num value) => delegate.detune = value;

  @override
  double get frequency => delegate.frequency;

  @override
  set frequency(num value) => delegate.frequency = value;

  @override
  double get gain => delegate.gain;

  @override
  set gain(num value) => delegate.gain = value;
}

// ------------------------------------------------------------------------------------------------------------------

class ChannelMergerNode extends AudioNode implements t.ChannelMergerNode {
  j.ChannelMergerNode delegate;

  @override
  j.ChannelMergerNode getDelegate() => delegate;

  /* ctor */ ChannelMergerNode.fromDelegate(this.delegate);
  /* ctor */ ChannelMergerNode(
    t.BaseAudioContext context, [
    t.ChannelMergerOptions? options,
  ]) : delegate = options == null
            ? j.ChannelMergerNode((context as BaseAudioContext).getDelegate())
            : j.ChannelMergerNode((context as BaseAudioContext).getDelegate(),
                (options as ChannelMergerOptions).delegate);
}

// ------------------------------------------------------------------------------------------------------------------

class ChannelMergerOptions extends AudioNodeOptions
    implements t.ChannelMergerOptions {
  j.ChannelMergerOptions delegate;

  @override
  j.ChannelMergerOptions getDelegate() => delegate;

  /* ctor */ ChannelMergerOptions.fromDelegate(this.delegate);
  /* ctor */ ChannelMergerOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    int? numberOfInputs,
  }) : delegate = j.ChannelMergerOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          numberOfInputs: numberOfInputs,
        );

  @override
  int get numberOfInputs => delegate.numberOfInputs;

  @override
  set numberOfInputs(int value) => delegate.numberOfInputs = value;
}

// ------------------------------------------------------------------------------------------------------------------

class ChannelSplitterNode extends AudioNode implements t.ChannelSplitterNode {
  j.ChannelSplitterNode delegate;

  @override
  j.ChannelSplitterNode getDelegate() => delegate;

  /* ctor */ ChannelSplitterNode.fromDelegate(this.delegate);
  /* ctor */ ChannelSplitterNode(
    t.BaseAudioContext context, [
    t.ChannelSplitterOptions? options,
  ]) : delegate = options == null
            ? j.ChannelSplitterNode((context as BaseAudioContext).getDelegate())
            : j.ChannelSplitterNode((context as BaseAudioContext).getDelegate(),
                (options as ChannelSplitterOptions).delegate);
}

// ------------------------------------------------------------------------------------------------------------------

class ChannelSplitterOptions extends AudioNodeOptions
    implements t.ChannelSplitterOptions {
  j.ChannelSplitterOptions delegate;

  @override
  j.ChannelSplitterOptions getDelegate() => delegate;

  /* ctor */ ChannelSplitterOptions.fromDelegate(this.delegate);
  /* ctor */ ChannelSplitterOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    int? numberOfOutputs,
  }) : delegate = j.ChannelSplitterOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          numberOfOutputs: numberOfOutputs,
        );

  @override
  int get numberOfOutputs => delegate.numberOfOutputs;

  @override
  set numberOfOutputs(int value) => delegate.numberOfOutputs = value;
}

// ------------------------------------------------------------------------------------------------------------------

class ConstantSourceNode extends AudioScheduledSourceNode
    implements t.ConstantSourceNode {
  j.ConstantSourceNode delegate;

  @override
  j.ConstantSourceNode getDelegate() => delegate;

  /* ctor */ ConstantSourceNode.fromDelegate(this.delegate);
  /* ctor */ ConstantSourceNode(
    t.BaseAudioContext context, [
    t.ConstantSourceOptions? options,
  ]) : delegate = options == null
            ? j.ConstantSourceNode((context as BaseAudioContext).getDelegate())
            : j.ConstantSourceNode((context as BaseAudioContext).getDelegate(),
                (options as ConstantSourceOptions).delegate);

  @override
  AudioParam get offset => AudioParam.fromDelegate(delegate.offset);
}

// ------------------------------------------------------------------------------------------------------------------

class ConstantSourceOptions extends AudioNodeOptions
    implements t.ConstantSourceOptions {
  j.ConstantSourceOptions delegate;

  @override
  j.ConstantSourceOptions getDelegate() => delegate;

  /* ctor */ ConstantSourceOptions.fromDelegate(this.delegate);
  /* ctor */ ConstantSourceOptions({num? offset})
      : delegate = j.ConstantSourceOptions(offset: offset);

  @override
  double get offset => delegate.offset;

  @override
  set offset(num value) => delegate.offset = value;
}

// ------------------------------------------------------------------------------------------------------------------

class ConvolverNode extends AudioNode implements t.ConvolverNode {
  j.ConvolverNode delegate;

  @override
  j.ConvolverNode getDelegate() => delegate;

  /* ctor */ ConvolverNode.fromDelegate(this.delegate);
  /* ctor */ ConvolverNode(
    t.BaseAudioContext context, [
    t.ConvolverOptions? options,
  ]) : delegate = options == null
            ? j.ConvolverNode((context as BaseAudioContext).getDelegate())
            : j.ConvolverNode((context as BaseAudioContext).getDelegate(),
                (options as ConvolverOptions).delegate);

  @override
  AudioBuffer? get buffer => delegate.buffer == null
      ? null
      : AudioBuffer.fromDelegate(delegate.buffer!);

  @override
  set buffer(t.AudioBuffer? value) =>
      delegate.buffer = (value as AudioBuffer?)?.delegate;

  @override
  bool get normalize => delegate.normalize;

  @override
  set normalize(bool value) => delegate.normalize = value;
}

// ------------------------------------------------------------------------------------------------------------------

class ConvolverOptions extends AudioNodeOptions implements t.ConvolverOptions {
  j.ConvolverOptions delegate;

  @override
  j.ConvolverOptions getDelegate() => delegate;

  /* ctor */ ConvolverOptions.fromDelegate(this.delegate);
  /* ctor */ ConvolverOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    t.AudioBuffer? buffer,
    bool? disableNormalization,
  }) : delegate = j.ConvolverOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          buffer: (buffer as AudioBuffer).delegate,
          disableNormalization: disableNormalization,
        );

  @override
  AudioBuffer? get buffer => delegate.buffer == null
      ? null
      : AudioBuffer.fromDelegate(delegate.buffer!);

  @override
  set buffer(t.AudioBuffer? value) =>
      delegate.buffer = (value as AudioBuffer?)?.delegate;

  @override
  bool get disableNormalization => delegate.disableNormalization;

  @override
  set disableNormalization(bool value) => delegate.disableNormalization = value;
}

// ------------------------------------------------------------------------------------------------------------------

class DelayNode extends AudioNode implements t.DelayNode {
  j.DelayNode delegate;

  @override
  j.DelayNode getDelegate() => delegate;

  /* ctor */ DelayNode.fromDelegate(this.delegate);
  /* ctor */ DelayNode(
    t.BaseAudioContext context, [
    t.DelayOptions? options,
  ]) : delegate = options == null
            ? j.DelayNode((context as BaseAudioContext).getDelegate())
            : j.DelayNode((context as BaseAudioContext).getDelegate(),
                (options as DelayOptions).delegate);

  @override
  AudioParam get delayTime => AudioParam.fromDelegate(delegate.delayTime);
}

// ------------------------------------------------------------------------------------------------------------------

class DelayOptions extends AudioNodeOptions implements t.DelayOptions {
  j.DelayOptions delegate;

  @override
  j.DelayOptions getDelegate() => delegate;

  /* ctor */ DelayOptions.fromDelegate(this.delegate);
  /* ctor */ DelayOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    num? maxDelayTime,
    num? delayTime,
  }) : delegate = j.DelayOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          maxDelayTime: maxDelayTime,
          delayTime: delayTime,
        );

  @override
  int get maxDelayTime => delegate.maxDelayTime.floor();

  @override
  set maxDelayTime(num value) => delegate.maxDelayTime = value;

  @override
  int get delayTime => delegate.delayTime.floor();

  @override
  set delayTime(num value) => delegate.delayTime = value;
}

// ------------------------------------------------------------------------------------------------------------------

class DynamicsCompressorNode extends AudioNode
    implements t.DynamicsCompressorNode {
  j.DynamicsCompressorNode delegate;

  @override
  j.DynamicsCompressorNode getDelegate() => delegate;

  /* ctor */ DynamicsCompressorNode.fromDelegate(this.delegate);
  /* ctor */ DynamicsCompressorNode(
    t.BaseAudioContext context, [
    t.DynamicsCompressorOptions? options,
  ]) : delegate = options == null
            ? j.DynamicsCompressorNode(
                (context as BaseAudioContext).getDelegate())
            : j.DynamicsCompressorNode(
                (context as BaseAudioContext).getDelegate(),
                (options as DynamicsCompressorOptions).delegate);

  @override
  AudioParam get threshold => AudioParam.fromDelegate(delegate.threshold);

  @override
  AudioParam get knee => AudioParam.fromDelegate(delegate.knee);

  @override
  AudioParam get ratio => AudioParam.fromDelegate(delegate.ratio);

  @override
  double get reduction => delegate.reduction;

  @override
  AudioParam get attack => AudioParam.fromDelegate(delegate.attack);

  @override
  AudioParam get release => AudioParam.fromDelegate(delegate.release);
}

// ------------------------------------------------------------------------------------------------------------------

class DynamicsCompressorOptions extends AudioNodeOptions
    implements t.DynamicsCompressorOptions {
  j.DynamicsCompressorOptions delegate;

  @override
  j.DynamicsCompressorOptions getDelegate() => delegate;

  /* ctor */ DynamicsCompressorOptions.fromDelegate(this.delegate);
  /* ctor */ DynamicsCompressorOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    num? attack,
    num? knee,
    num? ratio,
    num? release,
    num? threshold,
  }) : delegate = j.DynamicsCompressorOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          attack: attack,
          knee: knee,
          ratio: ratio,
          release: release,
          threshold: threshold,
        );

  @override
  double get attack => delegate.attack;

  @override
  set attack(num value) => delegate.attack = value;

  @override
  double get knee => delegate.knee;

  @override
  set knee(num value) => delegate.knee = value;

  @override
  double get ratio => delegate.ratio;

  @override
  set ratio(num value) => delegate.ratio = value;

  @override
  double get release => delegate.release;

  @override
  set release(num value) => delegate.release = value;

  @override
  double get threshold => delegate.threshold;

  @override
  set threshold(num value) => delegate.threshold = value;
}

// ------------------------------------------------------------------------------------------------------------------

class GainNode extends AudioNode implements t.GainNode {
  j.GainNode delegate;

  @override
  j.GainNode getDelegate() => delegate;

  /* ctor */ GainNode.fromDelegate(this.delegate);
  /* ctor */ GainNode(
    t.BaseAudioContext context, [
    t.GainOptions? options,
  ]) : delegate = options == null
            ? j.GainNode((context as BaseAudioContext).getDelegate())
            : j.GainNode((context as BaseAudioContext).getDelegate(),
                (options as GainOptions).delegate);

  @override
  AudioParam get gain => AudioParam.fromDelegate(delegate.gain);
}

// ------------------------------------------------------------------------------------------------------------------

class GainOptions extends AudioNodeOptions implements t.GainOptions {
  j.GainOptions delegate;

  @override
  j.GainOptions getDelegate() => delegate;

  /* ctor */ GainOptions.fromDelegate(this.delegate);
  /* ctor */ GainOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    num? gain,
  }) : delegate = j.GainOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          gain: gain,
        );

  @override
  double get gain => delegate.gain;

  @override
  set gain(num value) => delegate.gain = value;
}

// ------------------------------------------------------------------------------------------------------------------

class IIRFilterNode extends AudioNode implements t.IIRFilterNode {
  j.IIRFilterNode delegate;

  @override
  j.IIRFilterNode getDelegate() => delegate;

  /* ctor */ IIRFilterNode.fromDelegate(this.delegate);
  /* ctor */ IIRFilterNode(
    t.BaseAudioContext context,
    t.IIRFilterOptions options,
  ) : delegate = j.IIRFilterNode((context as BaseAudioContext).getDelegate(),
            (options as IIRFilterOptions).delegate);

  @override
  void getFrequencyResponse(
    t.TauFloat32Array frequencyHz,
    t.TauFloat32Array magResponse,
    t.TauFloat32Array phaseResponse,
  ) =>
      delegate.getFrequencyResponse(
          frequencyHz.toJS, magResponse.toJS, phaseResponse.toJS);
}

// ------------------------------------------------------------------------------------------------------------------

class IIRFilterOptions extends AudioNodeOptions implements t.IIRFilterOptions {
  j.IIRFilterOptions delegate;

  @override
  j.IIRFilterOptions getDelegate() => delegate;

  /* ctor */ IIRFilterOptions.fromDelegate(this.delegate);
  /* ctor */ IIRFilterOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    required t.TauArray<t.TauNumber> feedforward,
    required t.TauArray<t.TauNumber> feedback,
  }) : delegate = j.IIRFilterOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          feedforward: Interop().jsArrayNumber(feedforward),
          feedback: Interop().jsArrayNumber(feedback),
        );

  @override
  t.TauArray<t.TauNumber> get feedforward =>
      Interop().listNum(delegate.feedforward);

  @override
  set feedforward(t.TauArray<t.TauNumber> value) =>
      delegate.feedforward = Interop().jsArrayNumber(value);

  @override
  t.TauArray<t.TauNumber> get feedback => Interop().listNum(delegate.feedback);

  @override
  set feedback(t.TauArray<t.TauNumber> value) =>
      delegate.feedback = Interop().jsArrayNumber(value);
}

// ------------------------------------------------------------------------------------------------------------------

class MediaElementAudioSourceNode extends AudioNode
    implements t.MediaElementAudioSourceNode {
  j.MediaElementAudioSourceNode delegate;

  @override
  j.MediaElementAudioSourceNode getDelegate() => delegate;

  /* ctor */ MediaElementAudioSourceNode.fromDelegate(this.delegate);
  /* ctor */ MediaElementAudioSourceNode(
    t.AudioContext context,
    t.MediaElementAudioSourceOptions options,
  ) : delegate = j.MediaElementAudioSourceNode(
            (context as AudioContext).delegate,
            (options as MediaElementAudioSourceOptions).delegate);

  @override
  t.MediaElement get mediaElement =>
      MediaElement.fromDelegate(delegate.mediaElement as w.HTMLAudioElement);
}

// ------------------------------------------------------------------------------------------------------------------

class MediaElementAudioSourceOptions
    implements t.MediaElementAudioSourceOptions {
  j.MediaElementAudioSourceOptions delegate;
  j.MediaElementAudioSourceOptions getDelegate() => delegate;

  /* ctor */ MediaElementAudioSourceOptions.fromDelegate(this.delegate);
  /* ctor */ MediaElementAudioSourceOptions(
      {required t.MediaElement mediaElement})
      : delegate = j.MediaElementAudioSourceOptions(
          mediaElement: (mediaElement as MediaElement).delegate,
        );

  @override
  t.MediaElement get mediaElement =>
      MediaElement.fromDelegate(delegate.mediaElement as w.HTMLAudioElement);

  @override
  set mediaElement(t.MediaElement value) =>
      delegate.mediaElement = (value as MediaElement).delegate;
}

// ------------------------------------------------------------------------------------------------------------------

class MediaStreamAudioDestinationNode extends AudioNode
    implements t.MediaStreamAudioDestinationNode {
  j.MediaStreamAudioDestinationNode delegate;

  @override
  j.MediaStreamAudioDestinationNode getDelegate() => delegate;

  /* ctor */ MediaStreamAudioDestinationNode.fromDelegate(this.delegate);
  /* ctor */ MediaStreamAudioDestinationNode(
    t.AudioContext context, [
    t.AudioNodeOptions? options,
  ]) : delegate = options == null
            ? j.MediaStreamAudioDestinationNode(
                (context as AudioContext).delegate)
            : j.MediaStreamAudioDestinationNode(
                (context as AudioContext).delegate,
                (options as AudioNodeOptions).getDelegate());

  @override
  t.MediaStream get stream => MediaStream.fromDelegate(delegate.stream);
}

// ------------------------------------------------------------------------------------------------------------------

class MediaStreamAudioSourceNode extends AudioNode
    implements t.MediaStreamAudioSourceNode {
  j.MediaStreamAudioSourceNode delegate;

  @override
  j.MediaStreamAudioSourceNode getDelegate() => delegate;

  /* ctor */ MediaStreamAudioSourceNode.fromDelegate(this.delegate);
  /* ctor */ MediaStreamAudioSourceNode(
    t.AudioContext context,
    t.MediaStreamAudioSourceOptions options,
  ) : delegate = j.MediaStreamAudioSourceNode(
            (context as AudioContext).delegate,
            (options as MediaStreamAudioSourceOptions).delegate);

  @override
  t.MediaStream get mediaStream =>
      MediaStream.fromDelegate(delegate.mediaStream);
}

// ------------------------------------------------------------------------------------------------------------------

class MediaStreamAudioSourceOptions implements t.MediaStreamAudioSourceOptions {
  j.MediaStreamAudioSourceOptions delegate;
  j.MediaStreamAudioSourceOptions getDelegate() => delegate;

  /* ctor */ MediaStreamAudioSourceOptions.fromDelegate(this.delegate);
  /* ctor */ MediaStreamAudioSourceOptions({required t.MediaStream mediaStream})
      : delegate = j.MediaStreamAudioSourceOptions(
          mediaStream: (mediaStream as MediaStream).getDelegate(),
        );

  @override
  t.MediaStream get mediaStream =>
      MediaStream.fromDelegate(delegate.mediaStream);

  @override
  set mediaStream(t.MediaStream value) =>
      delegate.mediaStream = (value as MediaStream).delegate;
}

// ------------------------------------------------------------------------------------------------------------------

class MediaStreamTrackAudioSourceNode extends AudioNode
    implements t.MediaStreamTrackAudioSourceNode {
  j.MediaStreamTrackAudioSourceNode delegate;

  @override
  j.MediaStreamTrackAudioSourceNode getDelegate() => delegate;

  /* ctor */ MediaStreamTrackAudioSourceNode.fromDelegate(this.delegate);
  /* ctor */ MediaStreamTrackAudioSourceNode(
    t.AudioContext context,
    t.MediaStreamTrackAudioSourceOptions options,
  ) : delegate = j.MediaStreamTrackAudioSourceNode(
            (context as AudioContext).delegate,
            (options as MediaStreamTrackAudioSourceOptions).delegate);
}

// ------------------------------------------------------------------------------------------------------------------

class MediaStreamTrackAudioSourceOptions
    implements t.MediaStreamTrackAudioSourceOptions {
  j.MediaStreamTrackAudioSourceOptions delegate;
  j.MediaStreamTrackAudioSourceOptions getDelegate() => delegate;

  /* ctor */ MediaStreamTrackAudioSourceOptions.fromDelegate(this.delegate);
  /* ctor */ MediaStreamTrackAudioSourceOptions(
      {required t.MediaStreamTrack mediaStreamTrack})
      : delegate = j.MediaStreamTrackAudioSourceOptions(
          mediaStreamTrack: (mediaStreamTrack as MediaStreamTrack).delegate,
        );

  @override
  t.MediaStreamTrack get mediaStreamTrack =>
      MediaStreamTrack.fromDelegate(delegate.mediaStreamTrack);

  @override
  set mediaStreamTrack(t.MediaStreamTrack value) =>
      delegate.mediaStreamTrack = (value as MediaStreamTrack).delegate;
}

// ------------------------------------------------------------------------------------------------------------------

class OscillatorNode extends AudioScheduledSourceNode
    implements t.OscillatorNode {
  j.OscillatorNode delegate;

  @override
  j.OscillatorNode getDelegate() => delegate;

  /* ctor */ OscillatorNode.fromDelegate(this.delegate);
  /* ctor */ OscillatorNode(
    t.BaseAudioContext context, [
    t.OscillatorOptions? options,
  ]) : delegate = options == null
            ? j.OscillatorNode((context as AudioContext).delegate)
            : j.OscillatorNode((context as AudioContext).delegate,
                (options as OscillatorOptions).delegate);

  @override
  void setPeriodicWave(t.PeriodicWave periodicWave) =>
      delegate.setPeriodicWave((periodicWave as PeriodicWave).delegate);

  @override
  t.OscillatorType get type => delegate.type;

  @override
  set type(t.OscillatorType value) => delegate.type = value;

  @override
  AudioParam get frequency => AudioParam.fromDelegate(delegate.frequency);

  @override
  AudioParam get detune => AudioParam.fromDelegate(delegate.detune);
}

// ------------------------------------------------------------------------------------------------------------------

class OscillatorOptions extends AudioNodeOptions
    implements t.OscillatorOptions {
  j.OscillatorOptions delegate;

  @override
  j.OscillatorOptions getDelegate() => delegate;

  /* ctor */ OscillatorOptions.fromDelegate(this.delegate);
  /* ctor */ OscillatorOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    t.OscillatorType? type,
    num? frequency,
    num? detune,
    t.PeriodicWave? periodicWave,
  }) : delegate = j.OscillatorOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          type: type,
          frequency: frequency,
          detune: detune,
          periodicWave: (periodicWave as PeriodicWave?)?.delegate,
        );

  @override
  t.OscillatorType get type => delegate.type;

  @override
  set type(t.OscillatorType value) => delegate.type = value;

  @override
  double get frequency => delegate.frequency;

  @override
  set frequency(num value) => delegate.frequency = value;

  @override
  double get detune => delegate.detune;

  @override
  set detune(num value) => delegate.detune = value;

  @override
  PeriodicWave get periodicWave =>
      PeriodicWave.fromDelegate(delegate.periodicWave);

  @override
  set periodicWave(t.PeriodicWave value) =>
      delegate.periodicWave = (value as PeriodicWave).delegate;
}

// ------------------------------------------------------------------------------------------------------------------

class PannerNode extends AudioNode implements t.PannerNode {
  j.PannerNode delegate;

  @override
  j.PannerNode getDelegate() => delegate;

  /* ctor */ PannerNode.fromDelegate(this.delegate);
  /* ctor */ PannerNode(
    t.BaseAudioContext context, [
    t.PannerOptions? options,
  ]) : delegate = options == null
            ? j.PannerNode((context as AudioContext).delegate)
            : j.PannerNode((context as AudioContext).delegate,
                (options as PannerOptions).delegate);

  @override
  void setPosition(
    num x,
    num y,
    num z,
  ) =>
      delegate.setPosition(x, y, z);

  @override
  void setOrientation(
    num x,
    num y,
    num z,
  ) =>
      delegate.setOrientation(x, y, z);

  @override
  t.PanningModelType get panningModel => delegate.panningModel;

  @override
  set panningModel(t.PanningModelType value) => delegate.panningModel = value;

  @override
  AudioParam get positionX => AudioParam.fromDelegate(delegate.positionX);

  @override
  AudioParam get positionY => AudioParam.fromDelegate(delegate.positionY);

  @override
  AudioParam get positionZ => AudioParam.fromDelegate(delegate.positionZ);

  @override
  AudioParam get orientationX => AudioParam.fromDelegate(delegate.orientationX);

  @override
  AudioParam get orientationY => AudioParam.fromDelegate(delegate.orientationY);

  @override
  AudioParam get orientationZ => AudioParam.fromDelegate(delegate.orientationZ);

  @override
  t.DistanceModelType get distanceModel => delegate.distanceModel;

  @override
  set distanceModel(t.DistanceModelType value) =>
      delegate.distanceModel = value;

  @override
  double get refDistance => delegate.refDistance;

  @override
  set refDistance(num value) => delegate.refDistance = value;

  @override
  double get maxDistance => delegate.maxDistance;

  @override
  set maxDistance(num value) => delegate.maxDistance = value;

  @override
  double get rolloffFactor => delegate.rolloffFactor;

  @override
  set rolloffFactor(num value) => delegate.rolloffFactor = value;

  @override
  double get coneInnerAngle => delegate.coneInnerAngle;

  @override
  set coneInnerAngle(num value) => delegate.coneInnerAngle = value;

  @override
  double get coneOuterAngle => delegate.coneOuterAngle;

  @override
  set coneOuterAngle(num value) => delegate.coneOuterAngle = value;

  @override
  double get coneOuterGain => delegate.coneOuterGain;

  @override
  set coneOuterGain(num value) => delegate.coneOuterGain = value;
}

// ------------------------------------------------------------------------------------------------------------------

class PannerOptions extends AudioNodeOptions implements t.PannerOptions {
  j.PannerOptions delegate;

  @override
  j.PannerOptions getDelegate() => delegate;

  /* ctor */ PannerOptions.fromDelegate(this.delegate);
  /* ctor */ PannerOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    t.PanningModelType? panningModel,
    t.DistanceModelType? distanceModel,
    num? positionX,
    num? positionY,
    num? positionZ,
    num? orientationX,
    num? orientationY,
    num? orientationZ,
    num? refDistance,
    num? maxDistance,
    num? rolloffFactor,
    num? coneInnerAngle,
    num? coneOuterAngle,
    num? coneOuterGain,
  }) : delegate = j.PannerOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          panningModel: panningModel,
          distanceModel: distanceModel,
          positionX: positionX,
          positionY: positionY,
          positionZ: positionZ,
          orientationX: orientationX,
          orientationY: orientationY,
          orientationZ: orientationZ,
          refDistance: refDistance,
          maxDistance: maxDistance,
          rolloffFactor: rolloffFactor,
          coneInnerAngle: coneInnerAngle,
          coneOuterAngle: coneOuterAngle,
          coneOuterGain: coneOuterGain,
        );

  @override
  t.PanningModelType get panningModel => delegate.panningModel;

  @override
  set panningModel(t.PanningModelType value) => delegate.panningModel = value;

  @override
  t.DistanceModelType get distanceModel => delegate.distanceModel;

  @override
  set distanceModel(t.DistanceModelType value) =>
      delegate.distanceModel = value;

  @override
  double get positionX => delegate.positionX;

  @override
  set positionX(num value) => delegate.positionX = value;

  @override
  double get positionY => delegate.positionY;

  @override
  set positionY(num value) => delegate.positionY = value;

  @override
  double get positionZ => delegate.positionZ;

  @override
  set positionZ(num value) => delegate.positionZ = value;

  @override
  double get orientationX => delegate.orientationX;

  @override
  set orientationX(num value) => delegate.orientationX = value;

  @override
  double get orientationY => delegate.orientationY;

  @override
  set orientationY(num value) => delegate.orientationY = value;

  @override
  double get orientationZ => delegate.orientationZ;

  @override
  set orientationZ(num value) => delegate.orientationZ = value;

  @override
  double get refDistance => delegate.refDistance;

  @override
  set refDistance(num value) => delegate.refDistance = value;

  @override
  double get maxDistance => delegate.maxDistance;

  @override
  set maxDistance(num value) => delegate.maxDistance = value;

  @override
  double get rolloffFactor => delegate.rolloffFactor;

  @override
  set rolloffFactor(num value) => delegate.rolloffFactor = value;

  @override
  double get coneInnerAngle => delegate.coneInnerAngle;

  @override
  set coneInnerAngle(num value) => delegate.coneInnerAngle = value;

  @override
  double get coneOuterAngle => delegate.coneOuterAngle;

  @override
  set coneOuterAngle(num value) => delegate.coneOuterAngle = value;

  @override
  double get coneOuterGain => delegate.coneOuterGain;

  @override
  set coneOuterGain(num value) => delegate.coneOuterGain = value;
}

// ------------------------------------------------------------------------------------------------------------------

class PeriodicWave implements t.PeriodicWave {
  j.PeriodicWave delegate;
  j.PeriodicWave getDelegate() => delegate;

  /* ctor */ PeriodicWave.fromDelegate(this.delegate);
  /* ctor */ PeriodicWave(
    t.BaseAudioContext context, [
    t.PeriodicWaveOptions? options,
  ]) : delegate = options == null
            ? j.PeriodicWave((context as AudioContext).delegate)
            : j.PeriodicWave((context as AudioContext).delegate,
                (options as PeriodicWaveOptions).delegate);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class PeriodicWaveConstraints implements t.PeriodicWaveConstraints {
  //@override
  j.PeriodicWaveConstraints getDelegate();

  @override
  bool get disableNormalization => getDelegate().disableNormalization;

  @override
  set disableNormalization(bool value) =>
      getDelegate().disableNormalization = value;
}

class PeriodicWaveConstraintsImpl extends PeriodicWaveConstraints {
  j.PeriodicWaveConstraints delegate;

  @override
  j.PeriodicWaveConstraints getDelegate() => delegate;

  /* ctor */ PeriodicWaveConstraintsImpl.fromDelegate(this.delegate);
  /* ctor */ PeriodicWaveConstraintsImpl({bool? disableNormalization})
      : delegate = j.PeriodicWaveConstraints(
            disableNormalization: disableNormalization);
}

// ------------------------------------------------------------------------------------------------------------------

class PeriodicWaveOptions extends PeriodicWaveConstraints
    implements t.PeriodicWaveOptions {
  j.PeriodicWaveOptions delegate;

  @override
  j.PeriodicWaveOptions getDelegate() => delegate;

  /* ctor */ PeriodicWaveOptions.fromDelegate(this.delegate);
  /* ctor */ PeriodicWaveOptions({
    bool? disableNormalization,
    t.TauArray<t.TauNumber>? real,
    t.TauArray<t.TauNumber>? imag,
  }) : delegate = j.PeriodicWaveOptions(
          disableNormalization: disableNormalization,
          real: real == null ? null : Interop().jsArrayNumber(real),
          imag: imag == null ? null : Interop().jsArrayNumber(imag),
        );

  @override
  t.TauArray<t.TauNumber> get real => Interop().listNum(delegate.real);

  @override
  set real(t.TauArray<t.TauNumber> value) =>
      delegate.real = Interop().jsArrayNumber(value);

  @override
  t.TauArray<t.TauNumber> get imag => Interop().listNum(delegate.imag);

  @override
  set imag(t.TauArray<t.TauNumber> value) =>
      delegate.imag = Interop().jsArrayNumber(value);
}

// ------------------------------------------------------------------------------------------------------------------

class ScriptProcessorNode extends AudioNode implements t.ScriptProcessorNode {
  t.EventHandler _onaudioprocess = () {};
  j.ScriptProcessorNode delegate;

  @override
  j.ScriptProcessorNode getDelegate() => delegate;

  /* ctor */ ScriptProcessorNode.fromDelegate(this.delegate);

  @override
  t.EventHandler get onaudioprocess => _onaudioprocess;

  @override
  set onaudioprocess(t.EventHandler value) {
    _onaudioprocess = value;
    getDelegate().onaudioprocess = value.toJS;
  }

  @override
  int get bufferSize => delegate.bufferSize;
}

// ------------------------------------------------------------------------------------------------------------------

class StereoPannerNode extends AudioNode implements t.StereoPannerNode {
  j.StereoPannerNode delegate;

  @override
  j.StereoPannerNode getDelegate() => delegate;

  /* ctor */ StereoPannerNode.fromDelegate(this.delegate);
  /* ctor */ StereoPannerNode(
    t.BaseAudioContext context, [
    t.StereoPannerOptions? options,
  ]) : delegate = options == null
            ? j.StereoPannerNode((context as AudioContext).delegate)
            : j.StereoPannerNode((context as AudioContext).delegate,
                (options as StereoPannerOptions).delegate);

  @override
  AudioParam get pan => AudioParam.fromDelegate(delegate.pan);
}

// ------------------------------------------------------------------------------------------------------------------

class StereoPannerOptions extends AudioNodeOptions
    implements t.StereoPannerOptions {
  j.StereoPannerOptions delegate;

  @override
  j.StereoPannerOptions getDelegate() => delegate;

  /* ctor */ StereoPannerOptions.fromDelegate(this.delegate);
  /* ctor */ StereoPannerOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    num? pan,
  }) : delegate = j.StereoPannerOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          pan: pan,
        );

  @override
  double get pan => delegate.pan;

  @override
  set pan(num value) => delegate.pan = value;
}

// ------------------------------------------------------------------------------------------------------------------

class WaveShaperNode extends AudioNode implements t.WaveShaperNode {
  j.WaveShaperNode delegate;

  @override
  j.WaveShaperNode getDelegate() => delegate;

  /* ctor */ WaveShaperNode.fromDelegate(this.delegate);
  /* ctor */ WaveShaperNode(
    t.BaseAudioContext context, [
    t.WaveShaperOptions? options,
  ]) : delegate = options == null
            ? j.WaveShaperNode((context as AudioContext).delegate)
            : j.WaveShaperNode((context as AudioContext).delegate,
                (options as WaveShaperOptions).delegate);

  @override
  t.TauFloat32Array get curve => delegate.curve.toDart;

  @override
  set curve(t.TauFloat32Array value) => delegate.curve = value.toJS;

  @override
  t.OverSampleType get oversample => delegate.oversample;

  @override
  set oversample(t.OverSampleType value) => delegate.oversample = value;
}

// ------------------------------------------------------------------------------------------------------------------

class WaveShaperOptions extends AudioNodeOptions
    implements t.WaveShaperOptions {
  j.WaveShaperOptions delegate;

  @override
  j.WaveShaperOptions getDelegate() => delegate;

  /* ctor */ WaveShaperOptions.fromDelegate(this.delegate);
  /* ctor */ WaveShaperOptions({
    int? channelCount,
    t.ChannelCountMode? channelCountMode,
    t.ChannelInterpretation? channelInterpretation,
    t.TauArray<t.TauNumber>? curve,
    t.OverSampleType? oversample,
  }) : delegate = j.WaveShaperOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          curve: curve == null ? null : Interop().jsArrayNumber(curve),
          oversample: oversample,
        );

  @override
  t.TauArray<t.TauNumber> get curve => Interop().listNum(delegate.curve);

  @override
  set curve(t.TauArray<t.TauNumber> value) =>
      delegate.curve = Interop().jsArrayNumber(value);

  @override
  t.OverSampleType get oversample => delegate.oversample;

  @override
  set oversample(t.OverSampleType value) => delegate.oversample = value;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioWorklet implements t.AudioWorklet {
  j.AudioWorklet delegate;
  j.AudioWorklet getDelegate() => delegate;

  /* ctor */ AudioWorklet.fromDelegate(this.delegate);

  @override
  Future<void> addModule(String script) => delegate.addModule(script).toDart;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioWorkletGlobalScope implements t.AudioWorkletGlobalScope {
  j.AudioWorkletGlobalScope delegate;
  j.AudioWorkletGlobalScope getDelegate() => delegate;

  /* ctor */ AudioWorkletGlobalScope.fromDelegate(this.delegate);

  @override
  void registerProcessor(
    String name,
    t.AudioWorkletProcessorConstructor processorCtor,
  ) =>
      delegate.registerProcessor(name, processorCtor.toJS);

  @override
  int get currentFrame => delegate.currentFrame;

  @override
  int get currentTime => delegate.currentTime.floor();

  @override
  TauSampleRate get sampleRate => delegate.sampleRate;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioParamMap implements t.AudioParamMap {
  j.AudioParamMap delegate;
  j.AudioParamMap getDelegate() => delegate;

  /* ctor */ AudioParamMap.fromDelegate(this.delegate);

  @override
  dynamic getProperty(String key) => delegate.getProperty(key.toJS);

  @override
  void setProperty(String key, dynamic value) =>
      delegate.setProperty(key.toJS, value);

  //int get size => delegate.size;
  //dynamic get(String key) => delegate.get(key.toJS);
}

// ------------------------------------------------------------------------------------------------------------------

class AudioWorkletNode extends AudioNode implements t.AudioWorkletNode {
  t.EventHandler _onProcessorError = () {};
  late j.AudioWorkletNode delegate;

  @override
  j.AudioWorkletNode getDelegate() => delegate;

  /* ctor */ AudioWorkletNode.fromDelegate(
      this.delegate); // \\\\\\\\\\\\\\\\\\\
  /* ctor */ AudioWorkletNode(
    t.BaseAudioContext context,
    String name, [
    t.AudioWorkletNodeOptions? options,
  ]) : delegate = options == null
            ? j.AudioWorkletNode((context as AudioContext).delegate, name)
            : j.AudioWorkletNode((context as AudioContext).delegate, name,
                (options as AudioWorkletNodeOptions).delegate);
  /*
  {
    JSArray<JSNumber> cc = Interop().jsArrayInt(const [2]);
    j.AudioWorkletNodeOptions opt = j.AudioWorkletNodeOptions(
      channelCount: 2,
      channelCountMode: 'explicit',
      channelInterpretation: 'speakers',
      numberOfInputs: 1,
      numberOfOutputs: 1,
      outputChannelCount:  cc,
      //parameterData: parameterData,
      //processorOptions: processorOptions,
    );
    j.AudioWorkletNode jsNode = j.AudioWorkletNode((context as AudioContext).delegate, name,opt);
    delegate = jsNode;
     AudioWorkletNode.fromDelegate(jsNode);
  }

   */

  @override
  t.AudioParamMap get parameters =>
      AudioParamMap.fromDelegate(delegate.parameters);

  @override
  t.MessagePort get port => MessagePort.fromDelegate(delegate.port);

  @override
  t.EventHandler get onProcessorError => _onProcessorError;

  @override
  set onProcessorError(t.EventHandler value) {
    _onProcessorError = value;
    getDelegate().onprocessorerror = value.toJS;
  }
}

class AsyncWorkletNode extends AudioWorkletNode implements t.AsyncWorkletNode {
  t.OnAudioBufferUnderflowFn _onAudioBufferUnderflow = (int outputNo) {};

  t.OnReceiveDataFn _onReceiveData = (int outputNo, List<Float32List>? data) {
    // Dummy
  };

  /* ctor */ //AsyncWorkletNode.fromDelegate(delegate) : super.fromDelegate (delegate);
  /* ctor */ AsyncWorkletNode(
    super.context,
    super.name, [
    super.options,
  ]) //: super(context, name, options)
  {
    port.onmessage = (t.Message e) {
      var msg = e['msg'] as JSObject;
      var msgType = (msg.getProperty('messageType'.toJS) as JSString).toDart;
      switch (msgType) {
        case 'AUDIO_BUFFER_UNDERFLOW':
          int outputNo =
              (msg.getProperty('outputNo'.toJS) as JSNumber).toDartInt;
          _onAudioBufferUnderflow(outputNo);
          break;
        case 'RECEIVE_DATA': // Receive data from source to destination
          //List<Float32List>?
          //data = Interop().listFloat32List((d as JSArray<JSArray<JSNumber>>));
          var d = msg.getProperty('data'.toJS);
          List<JSAny> dd = (d as JSArray<JSAny>).toDart;
          List<Float32List> data = Interop().listFloat32List(dd);
          int inputNo = (msg.getProperty('inputNo'.toJS) as JSNumber).toDartInt;
          _onReceiveData(inputNo, data);
          break;
      }
    };
  }

  @override
  void onBufferUnderflow(t.OnAudioBufferUnderflowFn f) =>
      _onAudioBufferUnderflow = f;

  @override
  void onReceiveData(t.OnReceiveDataFn f) => _onReceiveData = f;

  @override
  void send({int outputNo = 0, required List<Float32List> data}) {
    JSObject obj = JSObject();
    obj.setProperty('msgType'.toJS, 'SEND_DATA'.toJS);
    obj.setProperty('outputNo'.toJS, outputNo.toJS);
    obj.setProperty('data'.toJS, Interop().jsArrayFloats(data));
    port.postMessage(obj);
  }

  @override
  void stop() {
    JSObject obj = JSObject();
    obj.setProperty('msgType'.toJS, 'STOP'.toJS);
    port.postMessage(obj);
  }
}

// =================================================================================================
//                          Added because of Tau_web
// =================================================================================================

class MediaStream implements t.MediaStream {
  w.MediaStream delegate;
  w.MediaStream getDelegate() => delegate;

  /* ctor */ MediaStream.fromDelegate(this.delegate);
  /* ctor */ MediaStream() : delegate = w.MediaStream();

  /* ctor */ //MediaStream({ bool audio = true, bool video = true}) : delegate = w.window.navigator.mediaDevices.getUserMedia(w.MediaStreamConstraints(  audio: true.toJS)).toDart;;

  @override
  String get id => delegate.id;
}

// ------------------------------------------------------------------------------------------------------------------

class MediaStreamTrack implements t.MediaStreamTrack {
  w.MediaStreamTrack delegate;
  w.MediaStreamTrack getDelegate() => delegate;

  /* ctor */ MediaStreamTrack.fromDelegate(this.delegate);
  /* ctor */ // MediaStreamTrack() : delegate = w.MediaStreamTrack();

// !!!Missing many methods, here
}

// ------------------------------------------------------------------------------------------------------------------

/*
class Worklet implements t.Worklet
{
  j.Worklet delegate;
  j.Worklet getDelegate() => delegate;

  /* ctor */ Worklet.fromDelegate(this.delegate);
  /* ctor */ Worklet();

}
*/

// ------------------------------------------------------------------------------------------------------------------

/*
class WorkletGlobalScope implements t.WorkletGlobalScope
{
  j.WorkletGlobalScope delegate;
  j.WorkletGlobalScope getDelegate() => delegate;

  /* ctor */ WorkletGlobalScope.fromDelegate(this.delegate);
  /* ctor */ WorkletGlobalScope();

}
 */

// ------------------------------------------------------------------------------------------------------------------

class MessagePort implements t.MessagePort {
  w.MessagePort delegate;
  w.MessagePort getDelegate() => delegate;
  t.MessageFn f = (e) {
    //print('Dummy');
  };
  /* ctor */ MessagePort.fromDelegate(this.delegate);
  /* ctor */ // MessagePort() : delegate = w.MessagePort();

  @override
  t.MessageFn get onmessage => f;

  @override
  void postMessage(t.Message msg) => delegate.postMessage(msg);

  @override
  set onmessage(f) {
    this.f = f;
    delegate.onmessage = rcvMessage.toJS;
  }

  void rcvMessage(w.MessageEvent e) {
//    Map<String, dynamic> data = (e.data as JSObject).;
    Map<String, dynamic> map = {
      'msg': e.data,
      'origin': e.origin,
      'type': e.type,
    };
    f(map);
  }
}

// ------------------------------------------------------------------------------------------------------------------

class ProcessorOptions implements t.ProcessorOptions {
  JSObject delegate;
  JSObject getDelegate() => delegate;

  /* ctor */ ProcessorOptions.fromDelegate(this.delegate);
  /* ctor */ ProcessorOptions(Map<String, dynamic> m) : delegate = JSObject() {
    m.forEach((key, value) {
      delegate.setProperty(key.toJS, value); //ob.parameters(key) = value;
    });
  }
}

// ------------------------------------------------------------------------------------------------------------------

class ParameterData implements t.ParameterData {
  JSObject delegate;
  JSObject getDelegate() => delegate;
  /* ctor */ ParameterData.fromDelegate(this.delegate);
  /* ctor */ ParameterData(Map<String, dynamic> m) : delegate = JSObject() {
    m.forEach((key, value) {
      delegate.setProperty(key.toJS, value); //ob.parameters(key) = value;
    });
  }
}

// ------------------------------------------------------------------------------------------------------------------

class AudioWorkletNodeOptions extends AudioNodeOptions
    implements t.AudioWorkletNodeOptions {
  j.AudioWorkletNodeOptions delegate;

  @override
  j.AudioWorkletNodeOptions getDelegate() => delegate;

  /* ctor */ AudioWorkletNodeOptions.fromDelegate(this.delegate);
  /* ctor */ AudioWorkletNodeOptions({
    int channelCount = 2,
    t.ChannelCountMode channelCountMode = 'exact',
    t.ChannelInterpretation channelInterpretation = 'speakers',
    int numberOfInputs = 0,
    int numberOfOutputs = 1,
    List<int> outputChannelCount = const [2],
    t.ParameterData? parameterData,
    t.ProcessorOptions? processorOptions,
  }) : delegate = j.AudioWorkletNodeOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          numberOfInputs: numberOfInputs,
          numberOfOutputs: numberOfOutputs,
          outputChannelCount: Interop().jsArrayInt(outputChannelCount),
        );

  @override
  int get numberOfInputs => delegate.numberOfInputs;

  @override
  set numberOfInputs(int value) => delegate.numberOfInputs = value;

  @override
  int get numberOfOutputs => delegate.numberOfOutputs;

  @override
  set numberOfOutputs(int value) => delegate.numberOfOutputs = value;

  @override
  List<int> get outputChannelCount =>
      Interop().listNumInt(delegate.outputChannelCount);

  @override
  set outputChannelCount(List<int> value) =>
      delegate.outputChannelCount = Interop().jsArrayInt(value);
  //t.ParameterData get parameterData => delegate.parameterData;
  //set parameterData(t.ParameterData value) => delegate.parameterData = value;
  //t.ProcessorOptions get processorOptions => delegate.processorOptions;
  //set processorOptions(t.ProcessorOptions value) => delegate.processorOptions = value;
}

// ------------------------------------------------------------------------------------------------------------------

class AudioWorkletProcessor implements t.AudioWorkletProcessor {
  w.AudioWorkletProcessor delegate;
  w.AudioWorkletProcessor getDelegate() => delegate;

  /* ctor */ AudioWorkletProcessor.fromDelegate(this.delegate);
  /* ctor */ AudioWorkletProcessor() : delegate = w.AudioWorkletProcessor();

  @override
  t.MessagePort get port => MessagePort.fromDelegate(delegate.port);
}

// ------------------------------------------------------------------------------------------------------------------

class MediaElement implements t.MediaElement {
  w.HTMLAudioElement delegate;
  w.HTMLAudioElement getDelegate() => delegate;

  /* ctor */ MediaElement.fromDelegate(this.delegate);
  /* ctor */ MediaElement({
    required String src,
  }) : delegate = w.HTMLAudioElement() {
    delegate.src = src;
  }

  @override
  TauTime get currentTime => delegate.currentTime.floor();

  @override
  set currentTime(TauTime currentTime) => delegate.currentTime = currentTime;

  @override
  bool get loop => delegate.loop;

  @override
  set loop(bool loop) => delegate.loop = loop;
  //play() => delegate.play().toDart;

  @override
  t.TauPromise<void> play() => delegate.play().toDart.then((e) {
        return null;
      });

  @override
  pause() => delegate.pause();

  @override
  bool paused() => delegate.paused;

  @override
  TauSampleRate get playbackRate => delegate.playbackRate;

  @override
  set playbackRate(TauSampleRate playbackRate) =>
      delegate.playbackRate = playbackRate;
  //t.EventHandler?  get onplay => delegate.onplay?.toDart as t.EventHandler;

  @override
  set onplay(t.EventHandler? f) => delegate.onplay = f?.toJS;

  @override
  String get src => delegate.src;

  @override
  set src(String src) => delegate.src = src;

  @override
  String? get crossorigin => delegate.crossOrigin;

  @override
  set crossorigin(String? crossorigin) => delegate.crossOrigin = crossorigin;
}

// ------------------------------------------------------------------------------------------------------------------

class MediaDevices implements t.MediaDevices {
  late w.MediaDevices delegate;
  /* ctor */ MediaDevices.fromDelegate(this.delegate);
  /* ctor */ MediaDevices() : delegate = w.window.navigator.mediaDevices;

  @override
  Future<MediaStream> getUserMedia(
      {bool audio = true, bool video = false}) async {
    var l = await delegate
        .getUserMedia(_mediaConstraints(audio: audio, video: video))
        .toDart;
    return MediaStream.fromDelegate(l);
  }

  w.MediaStreamConstraints _mediaConstraints(
          {bool audio = true, bool video = false}) =>
      w.MediaStreamConstraints(audio: audio.toJS, video: video.toJS);

  JSObject mapToJsObject(Map map) {
    var object = JSObject();
    map.forEach((k, v) {
      if (v is Map) {
        object.setProperty(k, mapToJsObject(v));
      } else {
        object.setProperty(k, v);
      }
    });
    return object;
  }

  @override
  Future<MediaStream> getUserMediaWithConstraints({
    required Map<String, Object> audio,
  }) async {
    var x = w.MediaStreamConstraints(
        audio: mapToJsObject(audio), video: false.toJS);
    var l = delegate.getUserMedia(x);
    var y = l.toDart;
    var z = await y;
    var r = MediaStream.fromDelegate(z);
    return r;
  }

  @override
  Future<List<t.MediaDeviceInfo>> enumerateDevices() async {
    var dev = await delegate.enumerateDevices().toDart;
    List<t.MediaDeviceInfo> r = [];
    for (var info in dev.toDart) {
      t.DeviceKind kind = t.DeviceKind.unknown;
      switch (info.kind) {
        case 'audioinput':
          kind = t.DeviceKind.audioinput;
          break;
        case 'audiooutput':
          kind = t.DeviceKind.audiooutput;
          break;
        case 'videoinput':
          kind = t.DeviceKind.videoinput;
          break;
      }
      r.add(t.MediaDeviceInfo(
          deviceId: info.deviceId,
          groupId: info.groupId,
          label: info.label,
          kind: kind));
    }
    return r;
  }
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`MediaRecorder`** interface of the
/// [MediaStream Recording API](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream_Recording_API)
/// provides functionality to easily record media. It is created using the
/// [MediaRecorder.MediaRecorder] constructor.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/MediaRecorder).
class MediaRecorder implements t.MediaRecorder {
  j.TauRecorder delegate; // Specific Tau
  @override
  String mimeType;

  /* ctor */ MediaRecorder.fromDelegate(this.delegate, this.mimeType);
  /* ctor */ MediaRecorder(
    t.MediaStream stream,
    this.mimeType, [
    t.MediaRecorderOptions? options,
  ]) : delegate = options == null
            ? j.TauRecorder((stream as MediaStream).delegate, mimeType)
            : j.TauRecorder((stream as MediaStream).delegate, mimeType,
                (options as MediaRecorderOptions).delegate);

  /// Specific τ
  @override
  String makeUrl() => delegate.makeUrl();

  /// Specific τ
  @override
  void makeFile(fileName) => delegate.makeFile(fileName);

  /// Specific τ
  @override
  Future<ByteBuffer> makeBuffer() => (delegate.makeBuffer().toDart).then((v) {
        return v.toDart;
      });

  /// The **`isTypeSupported()`** static method of the [MediaRecorder] interface
  /// returns a `Boolean` which is `true` if the MIME media type specified is
  /// one the user agent should be able to successfully record.
  @override
  bool isTypeSupported(String type) => j.MediaRecorder.isTypeSupported(type);

  /// The **`start()`** method of the [MediaRecorder] interface begins recording
  /// media into one or more [Blob] objects.
  ///
  /// You can
  /// record the entire duration of the media into a single `Blob` (or until you
  /// call [MediaRecorder.requestData]), or you can specify the
  /// number of milliseconds to record at a time. Then, each time that amount of
  /// media has
  /// been recorded, an event will be delivered to let you act upon the recorded
  /// media, while
  /// a new `Blob` is created to record the next slice of the media.
  ///
  /// Assuming the `MediaRecorder`'s [MediaRecorder.state]
  /// is `inactive`, `start()` sets the `state` to
  /// `recording`, then begins capturing media from the input stream. A
  /// `Blob` is created and the data is collected in it until the time slice
  /// period
  /// elapses or the source media ends. Each time a `Blob` is filled up to that
  /// point (the timeslice duration or the end-of-media, if no slice duration
  /// was provided), a
  /// [MediaRecorder.dataavailable_event] event is sent to the `MediaRecorder`
  /// with the
  /// recorded data. If the source is still playing, a new `Blob` is created and
  /// recording continues into that, and so forth.
  ///
  /// When the source stream ends, `state` is set to `inactive` and
  /// data gathering stops. A final [MediaRecorder.dataavailable_event] event is
  /// sent to the
  /// `MediaRecorder`, followed by a [MediaRecorder.stop_event] event.
  ///
  /// > **Note:** If the browser is unable to start recording or continue
  /// > recording, it will raise an [MediaRecorder.error_event] event, followed
  /// > by a
  /// > [MediaRecorder.dataavailable_event] event containing the `Blob` it
  /// > has gathered, followed by the [MediaRecorder.stop_event] event.
  @override
  void start([int? timeslice]) =>
      timeslice == null ? delegate.start() : delegate.start(timeslice);

  /// The **`stop()`** method of the [MediaRecorder] interface is
  /// used to stop media capture.
  ///
  /// When the `stop()` method is invoked, the UA queues a task that runs the
  /// following steps:
  ///
  /// 1. If [MediaRecorder.state] is "inactive", raise a DOM
  /// `InvalidState` error and terminate these steps. If the
  /// [MediaRecorder.state] is not "inactive", continue on to the next step.
  /// 2. Set the [MediaRecorder.state] to "inactive" and stop capturing media.
  /// 3. Raise a `dataavailable` event containing the Blob of data that has been
  /// gathered.
  /// 4. Raise a `stop` event.
  @override
  void stop() => delegate.stop();

  /// The **`pause()`** method of the [MediaRecorder] interface is used
  /// to pause recording of media streams.
  ///
  /// When a `MediaRecorder` object's `pause()`method is called, the
  /// browser queues a task that runs the below steps:
  ///
  /// 1. If [MediaRecorder.state] is "inactive", raise a DOM
  /// `InvalidState` error and terminate these steps. If not, continue to the
  /// next step.
  /// 2. Set [MediaRecorder.state] to "paused".
  /// 3. Stop gathering data into the current [Blob], but keep it available so
  /// that recording can be resumed later on.
  /// 4. Raise a [MediaRecorder.pause_event] event.
  @override
  void pause() => delegate.pause();

  /// The **`resume()`** method of the [MediaRecorder] interface is used to
  /// resume media recording when it has been previously paused.
  ///
  /// If [MediaRecorder.state] is already "recording", calling `resume()` has no
  /// effect.
  ///
  /// When the `resume()` method is invoked, the browser queues a task that runs
  /// the following steps:
  ///
  /// 1. If [MediaRecorder.state] is "inactive", raise a DOM
  /// `InvalidStateError` exception and terminate these steps. If
  /// [MediaRecorder.state] is not "inactive", continue to the next step.
  /// 2. Set [MediaRecorder.state] to "recording".
  /// 3. Continue gathering data into the current [Blob].
  /// 4. Raise a `resume` event.
  @override
  void resume() => delegate.resume();

  /// The **`requestData()`**
  /// method of the [MediaRecorder] interface is used to raise a
  /// [MediaRecorder.dataavailable_event] event containing a
  /// [Blob] object of the captured media as it was when the method was
  /// called. This can then be grabbed and manipulated as you wish.
  ///
  /// When the `requestData()` method is invoked, the browser queues a task that
  /// runs the following steps:
  ///
  /// 1. If [MediaRecorder.state] is "inactive", raise a DOM
  /// `InvalidState` error and terminate these steps. If
  /// [MediaRecorder.state] is not "inactive", continue to the next step.
  /// 2. Raise a [MediaRecorder.dataavailable_event] event containing a [Blob]
  /// of the
  /// currently captured data (the Blob is available under the event's `data`
  /// attribute.)
  /// 3. Create a new Blob and place subsequently captured data into it.
  @override
  void requestData() => delegate.requestData();

  /// The **`stream`** read-only property of the [MediaRecorder] interface
  /// returns the stream that was passed into the [MediaRecorder.MediaRecorder]
  /// constructor when the `MediaRecorder` was created.
  @override
  MediaStream get stream => MediaStream.fromDelegate(delegate.stream);

  /// The **`mimeType`** read-only property of the [MediaRecorder] interface
  /// returns the  media type that was specified when creating the
  /// [MediaRecorder] object, or, if none was specified, which was chosen by the
  /// browser.
  /// This is the file format of the file that would result from writing all of
  /// the recorded data to disk.
  ///
  /// Keep in mind that not all codecs are supported by a given container; if
  /// you write media using a codec that is not supported by a given media
  /// container, the resulting file may not work reliably if at all when you try
  /// to play it back.
  /// See our
  /// [media type and format guide](https://developer.mozilla.org/en-US/docs/Web/Media/Formats)
  /// for information about container and codec support across browsers.
  ///
  /// > **Note:** The term "MIME type" is officially considered to be
  /// > historical; these strings are now officially known as **media types**.
  /// > MDN Web Docs content uses the terms interchangeably.
  String get type => delegate.mimeType;

  /// The **`state`** read-only property of the [MediaRecorder] interface
  /// returns the current state of the current `MediaRecorder` object.
  @override
  RecordingState get state => delegate.state;
  //t.EventHandler get onstart =>  delegate.onstart?.toDart;
  @override
  set onstart(t.EventHandler f) => delegate.onstart = f.toJS;
  //t.EventHandler get onstop => delegate.onstop;
  @override
  set onstop(t.EventHandler value) => delegate.onstop = value.toJS;
  //t.EventHandler get ondataavailable => delegate.ondataavailable;
  @override
  set ondataavailable(t.EventHandler value) =>
      delegate.ondataavailable = value.toJS;
  //t.EventHandler get onpause => delegate.onpause;
  @override
  set onpause(t.EventHandler value) => delegate.onpause = value.toJS;
  //t.EventHandler get onresume => delegate.onresume;
  @override
  set onresume(t.EventHandler value) => delegate.onresume = value.toJS;
  //t.EventHandler get onerror => delegate.onerror;
  @override
  set onerror(t.EventHandler value) => delegate.onerror = value.toJS;

  /// The **`videoBitsPerSecond`** read-only
  /// property of the [MediaRecorder] interface returns the video encoding
  /// bit rate in use.
  ///
  /// This may differ from the bit rate specified in the
  /// constructor, if it was provided.
  @override
  int get videoBitsPerSecond => delegate.videoBitsPerSecond;

  /// The **`audioBitsPerSecond`** read-only
  /// property of the [MediaRecorder] interface returns the audio encoding bit
  /// rate in use.
  ///
  /// This may differ from the bit rate specified in the constructor (if
  /// it was provided).
  @override
  int get audioBitsPerSecond => delegate.audioBitsPerSecond;
}

class MediaRecorderOptions implements t.MediaRecorderOptions {
  late j.MediaRecorderOptions delegate;

  //@override
  j.MediaRecorderOptions getDelegate() => delegate;

  /* ctor */ MediaRecorderOptions({
    String? mimeType,
    int? audioBitsPerSecond,
    int? videoBitsPerSecond,
    int? bitsPerSecond,
    BitrateMode? audioBitrateMode,
    Duration? videoKeyFrameIntervalDuration,
    int? videoKeyFrameIntervalCount,
  }) : delegate = j.MediaRecorderOptions(
          mimeType: mimeType,
          audioBitsPerSecond: audioBitsPerSecond,
          videoBitsPerSecond: videoBitsPerSecond,
          bitsPerSecond: bitsPerSecond,
          audioBitrateMode: audioBitrateMode,
          videoKeyFrameIntervalDuration:
              videoKeyFrameIntervalDuration?.inMilliseconds,
          videoKeyFrameIntervalCount: videoKeyFrameIntervalCount,
        );

  @override
  String get mimeType => delegate.mimeType;

  @override
  set mimeType(String value) => delegate.mimeType = value;

  @override
  int get audioBitsPerSecond => delegate.audioBitsPerSecond;

  @override
  set audioBitsPerSecond(int value) => delegate.audioBitsPerSecond = value;

  @override
  int get videoBitsPerSecond => delegate.videoBitsPerSecond;

  @override
  set videoBitsPerSecond(int value) => delegate.videoBitsPerSecond = value;

  @override
  int get bitsPerSecond => delegate.bitsPerSecond;

  @override
  set bitsPerSecond(int value) => delegate.bitsPerSecond = value;

  @override
  BitrateMode get audioBitrateMode => delegate.audioBitrateMode;

  @override
  set audioBitrateMode(BitrateMode value) => delegate.audioBitrateMode = value;

  @override
  int get videoKeyFrameIntervalDuration =>
      delegate.videoKeyFrameIntervalDuration.floor();

  @override
  set videoKeyFrameIntervalDuration(t.DOMHighResTimeStamp value) =>
      delegate.videoKeyFrameIntervalDuration = value;

  @override
  int get videoKeyFrameIntervalCount => delegate.videoKeyFrameIntervalCount;

  @override
  set videoKeyFrameIntervalCount(int value) =>
      delegate.videoKeyFrameIntervalCount = value;
}

/// The **`BlobEvent`** interface of the
/// [MediaStream Recording API](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream_Recording_API)
/// represents events associated with a [Blob]. These blobs are typically, but
/// not necessarily, associated with media content.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/BlobEvent).
class BlobEvent implements t.BlobEvent {
  j.BlobEvent delegate;

  /* ctor */ BlobEvent.fromDelegate(this.delegate);
  /* ctor */ BlobEvent(
    String type,
    BlobEventInit eventInitDict,
  ) : delegate = j.BlobEvent(type, eventInitDict.delegate);

  /// The **`data`** read-only property of the [BlobEvent] interface represents
  /// a [Blob] associated with the event.
  @override
  Blob get data => Blob.fromDelegate(data.delegate);

  /// The **`timecode`** read-only property of the [BlobEvent] interface
  /// indicates the difference between the timestamp of the first chunk of data,
  /// and the timestamp of the first chunk in the first `BlobEvent` produced by
  /// this recorder.
  ///
  /// Note that the `timecode` in the first produced `BlobEvent` does not need
  /// to be zero.
  @override
  int get timecode => delegate.timecode.floor();
}

class BlobEventInit implements t.BlobEventInit {
  j.BlobEventInit delegate;

  /* ctor */ BlobEventInit.fromDelegate(this.delegate);
  /* ctor */ BlobEventInit({
    required Blob data,
    t.DOMHighResTimeStamp? timecode,
  }) : delegate = timecode == null
            ? j.BlobEventInit(data: data.delegate)
            : j.BlobEventInit(
                data: data.delegate, timecode: timecode.toDouble());

  @override
  Blob get data => Blob.fromDelegate(delegate.data);

  @override
  set data(t.Blob value) => delegate.data = (value as Blob).delegate;

  @override
  int get timecode => delegate.timecode.floor();

  @override
  set timecode(t.DOMHighResTimeStamp value) => delegate.timecode = value;
}

// ------------------------------------------------------------------------------------------------------------------

/*


class TauStreamDestinationNode extends AudioWorkletNode implements t.TauStreamDestinationNode
{
  late j.AudioWorkletNode delegate;
  j.AudioWorkletNode getDelegate() => delegate;
  Stream stream;

  /* ctor */ //TauStreamDestinationNode.fromDelegate(this.delegate);
  /* ctor */ TauStreamDestinationNode( t.BaseAudioContext context, this.stream) : super(context, 'toto')
  {
    delegate = j.AudioWorkletNode( (context as BaseAudioContext).getDelegate() , 'toto');
  }

}


// ------------------------------------------------------------------------------------------------------------------



class TauStreamNode extends AudioWorkletNode  implements t.TauStreamNode
{
  /* ctor */ TauStreamNode( t.BaseAudioContext context, String name, t.TauStreamNodeOptions? options) : super(context, name, options)
  {

  }
 
}

// ------------------------------------------------------------------------------------------------------------------



class TauStreamNodeOptions extends AudioWorkletNodeOptions implements t.TauStreamNodeOptions {
  //j.TauStreamNodeOptions delegate;
  //j.TauStreamNodeOptions getDelegate() => delegate;

  /* ctor */ //TauStreamNodeOptions.fromDelegate(this.delegate);
  /* ctor */ TauStreamNodeOptions({
    String momo = 'lolo',
    int channelCount = 2,
    t.ChannelCountMode channelCountMode = 'exact',
    t.ChannelInterpretation channelInterpretation = 'speakers',
    int numberOfInputs = 1,
    int numberOfOutputs = 1,
    List<int> outputChannelCount = const [2],
    t.ParameterData? parameterData,
    t.ProcessorOptions? processorOptions,
  }) : super(
    channelCount: channelCount,
    channelCountMode: channelCountMode,
    channelInterpretation: channelInterpretation,
    numberOfInputs: numberOfInputs,
    numberOfOutputs: numberOfOutputs,
    outputChannelCount: outputChannelCount,
    parameterData: parameterData,
    processorOptions: processorOptions,
  );


}
*/
// -----------------------------------------------------------------------------------------------------------------

/// The **`Blob`** interface represents a blob, which is a file-like object of
/// immutable, raw data; they can be read as text or binary data, or converted
/// into a [ReadableStream] so its methods can be used for processing the data.
///
/// Blobs can represent data that isn't necessarily in a JavaScript-native
/// format. The [File] interface is based on `Blob`, inheriting blob
/// functionality and expanding it to support files on the user's system.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/Blob).
class Blob implements t.Blob {
  w.Blob delegate;

  /* ctor */ Blob.fromDelegate(this.delegate);
  /*
  /* ctor */ Blob([
    List<t.BlobPart>? blobParts,
    BlobPropertyBag? options,
  ]) : delegate = w.Blob(blobParts, options.delegate);
*/
  /// The **`slice()`** method of the [Blob] interface
  /// creates and returns a new `Blob` object which contains data from a subset
  /// of
  /// the blob on which it's called.
  //@override
  //[LARPOUX]Blob slice([
  //  int? start,
  //  int? end,
  //   String? contentType,
  // ]) => Blob.fromDelegate(delegate.slice(start, end, contentType));

  /// The **`stream()`** method of the [Blob] interface returns a
  /// [ReadableStream] which upon reading returns the data contained within the
  /// `Blob`.
  //@override
  //[LARPOUX]ReadableStream stream() => delegate.stream;

  /// The **`text()`** method of the
  /// [Blob] interface returns a `Promise` that resolves with a
  /// string containing the contents of the blob, interpreted as UTF-8.
  //[LARPOUX]@override
  //[LARPOUX]Future<String> text() => delegate.text().toDart;

  /// The **`arrayBuffer()`** method of the [Blob]
  /// interface returns a `Promise` that resolves with the contents of the blob
  /// as
  /// binary data contained in an `ArrayBuffer`.
  //[LARPOUX]@override
  //[LARPOUX]Future<JSArrayBuffer> arrayBuffer() => delegate.arrayBuffer().toDart;

  /// The **`size`** read-only property of the [Blob] interface returns
  /// the size of the [Blob] or [File] in bytes.
  @override
  int get size => delegate.size;

  /// The **`type`** read-only property of the [Blob] interface returns the  of
  /// the file.
  ///
  /// > **Note:** Based on the current implementation, browsers won't actually
  /// > read the bytestream of a file to determine its media type.
  /// > It is assumed based on the file extension; a PNG image file renamed to
  /// > .txt would give "_text/plain_" and not "_image/png_". Moreover,
  /// > `blob.type` is generally reliable only for common file types like
  /// > images, HTML documents, audio and video.
  /// > Uncommon file extensions would return an empty string.
  /// > Client configuration (for instance, the Windows Registry) may result in
  /// > unexpected values even for common types. **Developers are advised not to
  /// > rely on this property as a sole validation scheme.**
  @override
  String get type => delegate.type;
}

class BlobPropertyBag implements t.BlobPropertyBag {
  w.BlobPropertyBag delegate;

  /* ctor */ BlobPropertyBag.fromDelegate(this.delegate);
  /*
  /* ctor */ BlobPropertyBag({
    String? type,
    t.EndingType? endings,
  }) : delegate = w.BlobPropertyBag(type: type, endings: endings);
*/

  @override
  String get type => delegate.type;

  @override
  set type(String value) => delegate.type = value;

  @override
  t.EndingType get endings => delegate.endings;

  @override
  set endings(t.EndingType value) => delegate.endings = value;
}

/*
class TauRecorder  extends MediaRecorder implements t.TauRecorder {
  j.TauRecorder tauRecorderDelegate;
  String type;
  /* ctor */ TauRecorder(t.MediaStream stream, this.type, [t.MediaRecorderOptions? options]) :
        tauRecorderDelegate = options == null ?
        j.TauRecorder((stream as MediaStream).delegate, type) :
        j.TauRecorder((stream as MediaStream).delegate, type, (options as MediaRecorderOptions).delegate),
        super(stream, options);

  String makeUrl() => tauRecorderDelegate.makeUrl();
  void  makeFile(fileName) => tauRecorderDelegate.makeFile(fileName);
  void start([int? timeslice]) => tauRecorderDelegate.start(timeslice);

}
*/
