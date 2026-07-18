<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "ISPhysical">
  <!ENTITY DetailTable "d38">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Issue Number">
  <!ENTITY c31 "Ngày phiếu xuất">
  <!ENTITY c32 "Issue Date">
]>

<dir table="m38$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu xuất kho thực tế" e="Physical Issue"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>


  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+1Q7qyYP4uS9qoPFnzAUS6X7TKY9L6PS3WcxoadIN6U4RUm9JLMOSI4wEUGc355LiohmV0wX/hvTZOEntSCHtQxJMqwY+lFCI1/n3sDSxzuOmmVfRU6MQBas4wHeGHJrmKUeOPZEgb+TtcANWi6t1rsz8Il397Xjyo9kDsdXbr6+QpuK4bo4OIqCcIWLHxhvbhkaYQwQEQz9yV/qficrMVwg/uTsq7CclEW3oW1x9FMEILO3zJ+UWpoEopqbmu8+cBaczrNGQ2+PybrTOZNN0xd+bs/dpwYFtGIRibK5+JcU+Lful2PEh+FBMj2XkaThfRiD7l76w9UcQ84bcJk2I/rHiW5NqooEi13i/BN2HohEURBpAJprlYcV7Ee9lIEcz0K89vWvhtA4lzEIxwDGY4w5gihN6af2rYivW8pLQ4sTPoWZ01uFE2yzHRNF56yL5</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YcT+6FXiQZwAm/WV0ALRtIPn06suE2Dp5mzFemQbmXqmMpy9WgV5TwEa4SH+jkmihOmfmi1p0PbPqknB5zoJDUaRFbN5LIR0G3Ylvf164X/DHOysTwVwv0MB6nS35l/+dZuEw62ZPgLx0xY6jAlVkB97JPsTONfGJ9a/veyvmwPRNho1LQ8NEZPiA3trNmXnQoSF+hBlTSV8cgi5kruI30Jhv0+kPYJyjVVkwa3tmDFTBVzUmSDFVim8z/8AabbCkA0yop9AQe5BJKEXpKfqgHYPL5FD8ZPH5LIMfPEwjY+wnp+GQXYZOGS9zzXwCBsRlzh5qxJ+GsKUrXRyN3bcPnYNX32QTcoDoAu5GdP7r8l2Og6XtamCMjwE3rSQHBGAFb0LCdu8gNFjc3qayvh/AkBNOfh/2wO28kHcH2kMSnsydgsBEQeU34RdIVaxw4h4CWqeG+kSmj6g3u1KGIgbsyl2qpQAqXWrlBJXrK+3O9CcqIUZZ6bSXvtJfnH2mVd6DiY43Ttj2TfeXvDYe7z8Gldct6WIAejbyPFl6vlEmuP/9ey2k7SwTljOA/UlOEM4jb9skKDWS1G3LLVyYHPSlEwB4M7SN/P0D9h+EO3SeU6I7PjWzrnHvGP6+xAx3uBg/bx96axi+ZMS5p0d8KlG371cgF/Ue8gpxMbwXbD4yEvIqdtek7PKkbgA7LvuUVG9G2Oq73fhuG41e3gYDBI8tQeYWDWqN9z3NfqOW0xDjSYDcz/Ems7h9AYSJOXDR6nMF39bk4sk5vrl5WqOSIloTAynMZoR4KWJF0dNgsOv9F2ClzPazUTXY+/NNrAqUJnUkTALV7NRxMwCVX2NBJa9DY/x5UUX3c3aKuvb6GkPq4iuHB6Bk3LygZwdS7YpTFgSL1xvmqS/sTO1U04giLrAZHIYSuj7soVyX+xQpJx2aU2cG8uQNVWuFxOtxPO7krOCd2yWsqwQPhkSalNSTzoFm71f40sPdSc/n6NwGHvVXkVIY8NP+DrJ8KORfjN+pWqOw2x3MhqeKBV2KyX0nUKjVjJNLVAh8SEvlgVkLqXry1pmu1ByBVtu2SIxhRbTnFFAzs=</encrypted>]]>
    </text>
  </script>
</dir>