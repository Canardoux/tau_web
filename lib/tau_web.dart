library tau_web;

import 'package:etau/etau.dart' show TauInterface;
import 'src/tauweb_implementation.dart' show TauwebImplementation;
import 'src/tauweb_implementation.dart' show TauwebJS;

/// This is the handle to get this `Etau` implementation.
TauInterface tau() => TauwebImplementation();

/// I do not remember what it is for !
/// @nodoc
TauwebJS tauwebJS() => TauwebJS();
