import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}

const List<MenuItem> appMenuItems = [
  MenuItem(
    title: 'Riverpod Counter',
    subTitle: 'introducción a Riverpod',
    link: '/counter',
    icon: Icons.countertops_outlined),
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'generales',
    link: '/progress',
    icon: Icons.refresh_rounded),
  MenuItem(
    title: 'Snackbars & Dialogues',
    subTitle: 'screen indicators',
    link: '/snackbars',
    icon: Icons.info_outline),
  MenuItem(
    title: 'Animated container',
    subTitle: 'stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'una serie de controles en flutter',
    link: '/ui_controls',
    icon: Icons.car_rental_outlined),
  MenuItem(
    title: 'Infinite Scroll & Pull',
    subTitle: 'listas infinitas y pull to request',
    link: '/infinite',
    icon: Icons.list_alt_rounded),
  MenuItem(
    title: 'Change theme',
    subTitle: 'cambiar tema de la aplicación',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined),
];

