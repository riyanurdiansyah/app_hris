part of 'navbar_cubit.dart';

class NavbarState extends Equatable {
  final int index;

  const NavbarState(this.index);

  @override
  List<Object> get props => [index];
}
