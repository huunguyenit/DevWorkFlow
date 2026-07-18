<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PDDomestic">
  <!ENTITY DetailTable "d94">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY c31 "Ngày đơn hàng">
  <!ENTITY c32 "Order Date">
]>

<dir table="m94$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đơn hàng" e="Order"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabjslrMsijk4iwxyGriACWoLLXPNInkajpDm22fs5PmeG</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+4gLn3zvA9O4/YSNKpRT+//WVhmYk0wRw906yZIb++Si236OCH6/mcVwUzS8Lh7+7nGBfm+++RyPuUw8NEYrLfEGfPMK+RZ+Rqha6zAjq21cJ49skJsUFZSsiLJF9Twy81rnpmoir74e16h5LzZyGBsEEfXYeOodwEX6FAW4vFZjVPiBkQ3+U6nBh3p9JQeZ72+JJ+oEXgzUpueMQwQLMdEVq9NyKB0kyrAjzjaDcOXXkHir4daMxkr/0TvI7I0q78v9jsuw3jRyuCVjxFg5tEHZfNxpNdCXfeOrCEB9w/uCXbK7U5XSY5vswgVoTYdk8CDyE9JvP4q9iyYS9xfMq9F7+oSFXemvlKUJlOlxuv3CRwrBFOSEWBryyeNGieRJ3CoIjj61Kn3NPUnuCpGEL1XNU/4Ei6069VT5S7SQtPMKaU3GwpuxcJQ5XRKu0Zxte</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36MyhwxjuJJROD8XL7gASRog+7cyJojfH118HOXgMCOeoO3P6mrJjV6xQf4+A/8HGYCQFZdvEnXDEwGR+kwVL7C1SMlJXSP7oN91bM6LdciHvgXmqjefDVJ6ZdSsu47RMXWYNiMJ0MNj52Yx8oOv/Vw8/DjLo7XBKtsdHmaVjpB1g6glEbFUqwhaDz1vp5SK0S5r1D/6pszh41ldMM6crZr2J15rgRyakLSxKPPzS0PRb35z6t+laa7kaPt42ux8lhj3jQgifKQFYbdngE4YhDj7dVugBkgBgnyI6jYNs16rETZizuz3QbrodIcdiHqrbWOTA/jEuE5EGDjiKHqQe3Z2OPeqeZmYA251g9WZ5VTQ/cPt2ok/sVYrx+jkGhVrFHE4Mg0H3DWp2tCixUHhhCI+4ncd6ZzBu+KpCViYG5gxVI3duJ+k0p/7vin0aFDLLBK6cXnZ2/lmCvtDJ7X9iLu8MPKmFgQVxw+OydpA5ggrAwzxeicNZrf15DCI3mRTyPYTmV0r8CTLaYZYehvb3GR4IQh4ilXneNUUnI8cA5ZSUzIVuhiln2JjQttJwqoxC9cymZ1tlj0xJ+9eX3C2dUN64=</encrypted>]]>
    </text>
  </script>
</dir>