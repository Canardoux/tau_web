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

import 'dart:async';
import 'package:etau/etau.dart';
import 'tauweb_class.dart' as c;
import 'dart:js_interop';
import 'package:logger/logger.dart' as log;

/// (I don't remember what it is for!)
/// @nodoc
extension type TauwebJS._(JSObject _) implements JSObject {
  external factory TauwebJS();
  external int papa(JSObject mediaRecorder);
  external int zozo(JSObject stream);
  external JSObject bloBEventData(JSObject blobEvent);
  //external JSObject blobArrayBuffer(JSObject blob);
  external JSPromise<JSObject> blobArrayBuffer(JSObject blob);
  external JSObject arrayBufferFloat32List(JSObject arrayBuffer);
}

/*
class Tauweb {
  TauwebJS delegate = TauwebJS();
  static final Tauweb _singleton = Tauweb._internal();
  factory Tauweb() => _singleton;
  Tauweb._internal();

  int papa(JSObject mediaRecorder) => delegate.papa(mediaRecorder);
  int zozo(JSObject stream) => delegate.zozo(stream);
  JSObject bloBEventData(JSObject blobEvent) =>
      delegate.bloBEventData(blobEvent);
  JSPromise<JSObject> blobArrayBuffer(JSObject blob) =>
      delegate.blobArrayBuffer(blob);
  JSObject arrayBufferFloat32List(JSObject arrayBuffer) =>
      delegate.arrayBufferFloat32List(arrayBuffer);
}
 */

/// This class is the Etau implementation for Flutter Web.
/// It has no public interface.
/// The App just import this implementation and use `tau()` to access it.
/// All the rest of API is done by `etau`
class TauwebImplementation implements TauInterface {
  static final TauwebImplementation _singleton =
      TauwebImplementation._internal();
  factory TauwebImplementation() => _singleton;
  late log.Logger _logger;

  @override
  log.Logger logger() => _logger;

  //static int papa() => TauwebJS.papa();

  TauwebImplementation._internal();

  @override
  MediaDevices getDevices() => c.MediaDevices();

  static bool alreadyInited = false;

  @override
  Future<void> init([log.Level loglevel = log.Level.debug]) async {
    _logger = log.Logger();
    log.Logger.level = loglevel;
    if (!alreadyInited) {
      await importModule("./assets/packages/tau_web/assets/js/tau_web.js".toJS)
          .toDart;
      alreadyInited = true;
    }
  }

  @override
  AudioContext newAudioContext([AudioContextOptions? contextOptions]) =>
      c.AudioContext(contextOptions);

  @override
  AudioContextOptions newAudioContextOptions({
    TauAny? latencyHint,
    TauSampleRate? sampleRate,
    TauAny? sinkId,
    TauAny? renderSizeHint,
  }) =>
      c.AudioContextOptions(
          latencyHint: latencyHint,
          sampleRate: sampleRate,
          sinkId: sinkId,
          renderSizeHint: renderSizeHint);

  //@override
  //AudioSinkOptions newAudioSinkOptions({required AudioSinkType type}) =>
  //    c.AudioSinkOptions(type: type);

  @override
  AudioTimestamp newAudioTimestamp({
    num? contextTime,
    TauHighResTimeStamp? performanceTime,
  }) =>
      c.AudioTimestamp(
          contextTime: contextTime, performanceTime: performanceTime);

  @override
  OfflineAudioContext newOfflineAudioContext(
    TauAny contextOptionsOrNumberOfChannels, [
    int? length,
    TauSampleRate? sampleRate,
  ]) =>
      c.OfflineAudioContext(
          contextOptionsOrNumberOfChannels, length, sampleRate);

  /*
  @override
  OfflineAudioContextOptions newOfflineAudioContextOptions({
    int? numberOfChannels,
    required int length,
    required TauSampleRate sampleRate,
    TauAny? renderSizeHint,
  }) =>
      c.OfflineAudioContextOptions(
        numberOfChannels: numberOfChannels,
        length: length,
        sampleRate: sampleRate,
        renderSizeHint: renderSizeHint,
      );

  @override
  OfflineAudioCompletionEvent newOfflineAudioCompletionEvent(
    String type,
    OfflineAudioCompletionEventInit eventInitDict,
  ) =>
      c.OfflineAudioCompletionEvent(type, eventInitDict);

  @override
  OfflineAudioCompletionEventInit newOfflineAudioCompletionEventInit({
    bool? bubbles,
    bool? cancelable,
    bool? composed,
    required AudioBuffer renderedBuffer,
  }) =>
      c.OfflineAudioCompletionEventInit(
          bubbles: bubbles,
          cancelable: cancelable,
          composed: composed,
          renderedBuffer: renderedBuffer);
*/
  @override
  AudioBuffer newAudioBuffer(AudioBufferOptions options) =>
      c.AudioBuffer(options);

  @override
  AudioBufferOptions newAudioBufferOptions({
    int? numberOfChannels,
    required int length,
    required TauSampleRate sampleRate,
  }) =>
      c.AudioBufferOptions(
          numberOfChannels: numberOfChannels,
          length: length,
          sampleRate: sampleRate);

  @override
  AudioNodeOptions newAudioNodeOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
  }) =>
      c.AudioNodeOptionsImp(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation);

  @override
  AnalyserNode newAnalyserNode(
    BaseAudioContext context, [
    AnalyserOptions? options,
  ]) =>
      c.AnalyserNode(context, options);

  @override
  AnalyserOptions newAnalyserOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    int? fftSize,
    num? maxDecibels,
    num? minDecibels,
    num? smoothingTimeConstant,
  }) =>
      c.AnalyserOptions(
        channelCount: channelCount,
        channelCountMode: channelCountMode,
        channelInterpretation: channelInterpretation,
        fftSize: fftSize,
        maxDecibels: maxDecibels,
        minDecibels: minDecibels,
        smoothingTimeConstant: smoothingTimeConstant,
      );

  @override
  AudioBufferSourceNode newAudioBufferSourceNode(
    BaseAudioContext context, [
    AudioBufferSourceOptions? options,
  ]) =>
      c.AudioBufferSourceNode(context, options);

  @override
  AudioBufferSourceOptions newAudioBufferSourceOptions({
    AudioBuffer? buffer,
    num? detune,
    bool? loop,
    num? loopEnd,
    num? loopStart,
    num? playbackRate,
  }) =>
      c.AudioBufferSourceOptions(
        buffer: buffer,
        detune: detune,
        loop: loop,
        loopEnd: loopEnd,
        loopStart: loopStart,
        playbackRate: playbackRate,
      );

  @override
  AudioProcessingEvent newAudioProcessingEvent(
    String type,
    AudioProcessingEventInit eventInitDict,
  ) =>
      c.AudioProcessingEvent(type, eventInitDict);

  /*
  @override
  AudioProcessingEventInit newAudioProcessingEventInit({
    bool? bubbles,
    bool? cancelable,
    bool? composed,
    required num playbackTime,
    required AudioBuffer inputBuffer,
    required AudioBuffer outputBuffer,
  }) =>
      c.AudioProcessingEventInit(
        bubbles: bubbles,
        cancelable: cancelable,
        composed: composed,
        playbackTime: playbackTime,
        inputBuffer: inputBuffer,
        outputBuffer: outputBuffer,
      );

   */

  @override
  BiquadFilterNode newBiquadFilterNode(
    BaseAudioContext context, [
    BiquadFilterOptions? options,
  ]) =>
      c.BiquadFilterNode(context, options);

  @override
  BiquadFilterOptions newBiquadFilterOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    BiquadFilterType? type,
    num? Q,
    num? detune,
    num? frequency,
    num? gain,
  }) =>
      c.BiquadFilterOptions(
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
  ChannelMergerNode newChannelMergerNode(
    BaseAudioContext context, [
    ChannelMergerOptions? options,
  ]) =>
      c.ChannelMergerNode(
        context,
        options,
      );

  @override
  ChannelMergerOptions newChannelMergerOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    int? numberOfInputs,
  }) =>
      c.ChannelMergerOptions(
        channelCount: channelCount,
        channelCountMode: channelCountMode,
        channelInterpretation: channelInterpretation,
        numberOfInputs: numberOfInputs,
      );

  @override
  ChannelSplitterNode newChannelSplitterNode(
    BaseAudioContext context, [
    ChannelSplitterOptions? options,
  ]) =>
      c.ChannelSplitterNode(
        context,
        options,
      );

  @override
  ChannelSplitterOptions newChannelSplitterOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    int? numberOfOutputs,
  }) =>
      c.ChannelSplitterOptions(
        channelCount: channelCount,
        channelCountMode: channelCountMode,
        channelInterpretation: channelInterpretation,
        numberOfOutputs: numberOfOutputs,
      );

  @override
  ConstantSourceNode newConstantSourceNode(
    BaseAudioContext context, [
    ConstantSourceOptions? options,
  ]) =>
      c.ConstantSourceNode(
        context,
        options,
      );

  @override
  ConstantSourceOptions newConstantSourceOptions({num? offset}) =>
      c.ConstantSourceOptions(offset: offset);

  @override
  ConvolverNode newConvolverNode(
    BaseAudioContext context, [
    ConvolverOptions? options,
  ]) =>
      c.ConvolverNode(
        context,
        options,
      );

  @override
  ConvolverOptions newConvolverOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    AudioBuffer? buffer,
    bool? disableNormalization,
  }) =>
      c.ConvolverOptions(
        channelCount: channelCount,
        channelCountMode: channelCountMode,
        channelInterpretation: channelInterpretation,
        buffer: buffer,
        disableNormalization: disableNormalization,
      );

  @override
  DelayNode newDelayNode(
    BaseAudioContext context, [
    DelayOptions? options,
  ]) =>
      c.DelayNode(
        context,
        options,
      );

  @override
  DelayOptions newDelayOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    num? maxDelayTime,
    num? delayTime,
  }) =>
      c.DelayOptions(
        channelCount: channelCount,
        channelCountMode: channelCountMode,
        channelInterpretation: channelInterpretation,
        maxDelayTime: maxDelayTime,
        delayTime: delayTime,
      );

  @override
  DynamicsCompressorNode newDynamicsCompressorNode(
    BaseAudioContext context, [
    DynamicsCompressorOptions? options,
  ]) =>
      c.DynamicsCompressorNode(
        context,
        options,
      );

  @override
  DynamicsCompressorOptions newDynamicsCompressorOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    num? attack,
    num? knee,
    num? ratio,
    num? release,
    num? threshold,
  }) =>
      c.DynamicsCompressorOptions(
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
  GainNode newGainNode(
    BaseAudioContext context, [
    GainOptions? options,
  ]) =>
      c.GainNode(
        context,
        options,
      );

  @override
  GainOptions newGainOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    num? gain,
  }) =>
      c.GainOptions(
        channelCount: channelCount,
        channelCountMode: channelCountMode,
        channelInterpretation: channelInterpretation,
        gain: gain,
      );

  @override
  IIRFilterNode newIIRFilterNode(
    BaseAudioContext context,
    IIRFilterOptions options,
  ) =>
      c.IIRFilterNode(
        context,
        options,
      );

  @override
  IIRFilterOptions newIIRFilterOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    required TauArray<TauNumber> feedforward,
    required TauArray<TauNumber> feedback,
  }) =>
      c.IIRFilterOptions(
          channelCount: channelCount,
          channelCountMode: channelCountMode,
          channelInterpretation: channelInterpretation,
          feedforward: feedforward,
          feedback: feedback);

  @override
  MediaElementAudioSourceNode newMediaElementAudioSourceNode(
    AudioContext context,
    MediaElementAudioSourceOptions options,
  ) =>
      c.MediaElementAudioSourceNode(
        context,
        options,
      );

  @override
  MediaElementAudioSourceOptions newMediaElementAudioSourceOptions(
          {required MediaElement mediaElement}) =>
      c.MediaElementAudioSourceOptions(
        mediaElement: mediaElement,
      );

  @override
  MediaStreamAudioDestinationNode newMediaStreamAudioDestinationNode(
    AudioContext context, [
    AudioNodeOptions? options,
  ]) =>
      c.MediaStreamAudioDestinationNode(
        context,
        options,
      );

  @override
  MediaStreamAudioSourceNode newMediaStreamAudioSourceNode(
    AudioContext context,
    MediaStreamAudioSourceOptions options,
  ) =>
      c.MediaStreamAudioSourceNode(
        context,
        options,
      );

  @override
  MediaStreamAudioSourceOptions newMediaStreamAudioSourceOptions(
          {required MediaStream mediaStream}) =>
      c.MediaStreamAudioSourceOptions(
        mediaStream: mediaStream,
      );

  @override
  MediaStreamTrackAudioSourceNode newMediaStreamTrackAudioSourceNode(
    AudioContext context,
    MediaStreamTrackAudioSourceOptions options,
  ) =>
      c.MediaStreamTrackAudioSourceNode(
        context,
        options,
      );

  @override
  MediaStreamTrackAudioSourceOptions newMediaStreamTrackAudioSourceOptions(
          {required MediaStreamTrack mediaStreamTrack}) =>
      c.MediaStreamTrackAudioSourceOptions(
        mediaStreamTrack: mediaStreamTrack,
      );

  @override
  OscillatorNode newOscillatorNode(
    BaseAudioContext context, [
    OscillatorOptions? options,
  ]) =>
      c.OscillatorNode(
        context,
        options,
      );

  @override
  OscillatorOptions newOscillatorOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    OscillatorType? type,
    num? frequency,
    num? detune,
    PeriodicWave? periodicWave,
  }) =>
      c.OscillatorOptions(
        channelCount: channelCount,
        channelCountMode: channelCountMode,
        channelInterpretation: channelInterpretation,
        type: type,
        frequency: frequency,
        detune: detune,
        periodicWave: periodicWave,
      );

  @override
  PannerNode newPannerNode(
    BaseAudioContext context, [
    PannerOptions? options,
  ]) =>
      c.PannerNode(
        context,
        options,
      );

  @override
  PannerOptions newPannerOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    PanningModelType? panningModel,
    DistanceModelType? distanceModel,
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
  }) =>
      c.PannerOptions(
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
  PeriodicWave newPeriodicWave(
    BaseAudioContext context, [
    PeriodicWaveOptions? options,
  ]) =>
      c.PeriodicWave(
        context,
        options,
      );

  @override
  PeriodicWaveConstraints newPeriodicWaveConstraints(
          {bool? disableNormalization}) =>
      c.PeriodicWaveConstraintsImpl(disableNormalization: disableNormalization);

  @override
  PeriodicWaveOptions newPeriodicWaveOptions({
    bool? disableNormalization,
    TauArray<TauNumber>? real,
    TauArray<TauNumber>? imag,
  }) =>
      c.PeriodicWaveOptions(
        disableNormalization: disableNormalization,
        real: real,
        imag: imag,
      );

  @override
  StereoPannerNode newStereoPannerNode(
    BaseAudioContext context, [
    StereoPannerOptions? options,
  ]) =>
      c.StereoPannerNode(
        context,
        options,
      );

  @override
  StereoPannerOptions newStereoPannerOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    num? pan,
  }) =>
      c.StereoPannerOptions(
        channelCount: channelCount,
        channelCountMode: channelCountMode,
        channelInterpretation: channelInterpretation,
        pan: pan,
      );

  @override
  WaveShaperNode newWaveShaperNode(
    BaseAudioContext context, [
    WaveShaperOptions? options,
  ]) =>
      c.WaveShaperNode(
        context,
        options,
      );

  @override
  WaveShaperOptions newWaveShaperOptions({
    int? channelCount,
    ChannelCountMode? channelCountMode,
    ChannelInterpretation? channelInterpretation,
    TauArray<TauNumber>? curve,
    OverSampleType? oversample,
  }) =>
      c.WaveShaperOptions(
        channelCount: channelCount,
        channelCountMode: channelCountMode,
        channelInterpretation: channelInterpretation,
        curve: curve,
        oversample: oversample,
      );

  @override
  AudioWorkletNode newAudioWorkletNode(
    BaseAudioContext context,
    String name, [
    AudioWorkletNodeOptions? options,
  ]) =>
      c.AudioWorkletNode(
        context,
        name,
        options,
      );

  @override
  AsyncWorkletNode newAsyncWorkletNode(
    BaseAudioContext context,
    String name, [
    AudioWorkletNodeOptions? options,
  ]) =>
      c.AsyncWorkletNode(
        context,
        name,
        options,
      );

  @override
  AudioWorkletNodeOptions newAudioWorkletNodeOptions({
    int channelCount = 2,
    ChannelCountMode channelCountMode = 'exact',
    ChannelInterpretation channelInterpretation = 'speakers',
    int numberOfInputs = 1,
    int numberOfOutputs = 1,
    TauArray<int> outputChannelCount = const [2],
    ParameterData? parameterData,
    ProcessorOptions? processorOptions,
  }) =>
      c.AudioWorkletNodeOptions(
        channelCount: channelCount,
        channelCountMode: channelCountMode,
        channelInterpretation: channelInterpretation,
        numberOfInputs: numberOfInputs,
        numberOfOutputs: numberOfOutputs,
        outputChannelCount: outputChannelCount,
        parameterData: parameterData,
        processorOptions: processorOptions,
      );

  @override
  AudioWorkletProcessor newAudioWorkletProcessor() => c.AudioWorkletProcessor();

  @override
  ParameterData newParameterData(Map<String, dynamic> m) => c.ParameterData(m);

  @override
  ProcessorOptions newProcessorOptions(Map<String, dynamic> m) =>
      c.ProcessorOptions(m);

// =================================================================================================
//                          Added because of tauweb_mediacapture_streams.dart
// =================================================================================================

  /*
  @override
  MediaRecorder newMediaRecorder(
      MediaStream stream, [
        MediaRecorderOptions? options,
      ]) => c.MediaRecorder(stream, options);
*/

  @override
  MediaRecorderOptions newMediaRecorderOptions({
    String? mimeType,
    int? audioBitsPerSecond,
    int? videoBitsPerSecond,
    int? bitsPerSecond,
    c.BitrateMode? audioBitrateMode,
    Duration? videoKeyFrameIntervalDuration,
    int? videoKeyFrameIntervalCount,
  }) =>
      c.MediaRecorderOptions(
          mimeType: mimeType,
          audioBitsPerSecond: audioBitsPerSecond,
          videoBitsPerSecond: videoBitsPerSecond,
          bitsPerSecond: bitsPerSecond,
          audioBitrateMode: audioBitrateMode,
          videoKeyFrameIntervalDuration: videoKeyFrameIntervalDuration,
          videoKeyFrameIntervalCount: videoKeyFrameIntervalCount);

  @override
  MediaRecorder newMediaRecorder(
    MediaStream stream,
    String mimeType, [
    MediaRecorderOptions? options,
  ]) =>
      c.MediaRecorder(stream, mimeType, options);

  @override
  MediaStream newMediaStream() => c.MediaStream();

  @override
  MediaElement newMediaElement({
    required String src,
  }) =>
      c.MediaElement(
        src: src,
      );

/*
  MediaRecorderOptions newMediaRecorderOptions(
      {
        String mimeType,
        int audioBitsPerSecond,
        int videoBitsPerSecond,
        int bitsPerSecond,
        BitrateMode audioBitrateMode,
        DOMHighResTimeStamp videoKeyFrameIntervalDuration,
        int videoKeyFrameIntervalCount,

      }) => c.MediaRecorderOptions(
     mimeType: mimeType,
     audioBitsPerSecond: audioBitsPerSecond,
     videoBitsPerSecond: videoBitsPerSecond,
     bitsPerSecond: bitsPerSecond,
     audioBitrateMode: audioBitrateMode,
     videoKeyFrameIntervalDuration: videoKeyFrameIntervalDuration,
     videoKeyFrameIntervalCount: videoKeyFrameIntervalCount,

  );
*/
}
