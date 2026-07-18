<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultForm "DTSOCPDTXD">
  <!ENTITY circularForm195 "DTSOCPDTXD_A04195">
  <!ENTITY circularForm200 "DTSOCPDTXD_A08200">
  <!ENTITY circularForm133 "DTSOCPDTXD_A08133">

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir table="dtsocpdtxd" code="form" order="form" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    &CircularTypeField;
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="11000-: [chon_tt].Label, [chon_tt]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1pVRHR80siB1o0jbGLunY+r+TgyQ+5zs0BeUpyZK6zADUaJCj44hrseaqQocvRhrG9lG7lmWWm4jvroTeduFxfgdi6w/khq1W+k1b3d0U3lj0v9aaStCLvT3o7BWQL3giqzHvjHyK4lrm++K2rwzobic+jE2WLd+VS35YRRGozmD2YRzLrLMZr6rk4lFLzwaLFpxcouMcl+apmVHvf5tpw=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBZLRMKmDIAlpYfnMklmAp9grkEiTukUgGarEMHCfqv8vQtWzG/YmH/HtxpZb0NBaYTa7kdiWb/FsmH8q67i69fo1nNijbNLB/ZQ8Kgc3obg/eB6S5c/gihGSBLYNLCoLg</Encrypted>]]>
      </text>
    </command>
    
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDye4oi1v6IyH84gkaCuYc68w7b8tAggThsVckdFNi4liz3cFGXs2ONRgZHMN0Lec0oWoBhZYLvx7U2musHc+KMQsjciIFw/yyKOUBzgLjE5qEYPWdA81fBdwNi5FlK7cKZ8=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6E3Ddjd1Ud7FD6zx9Cgrasm/rrvc+Gk8PoYuCx/dTj2sRuo+KmV68tv0XazHY+XYoVyRJdFRJHjyBmPfhNQ0EPxjCmLcbbYVI0AL2RoUamO2JluJ0tK+zCzMSVu8BVYbL4shTrfu8VP+L+aCOGtozIWutbha3AuBk/1uWnesIzFQ5aR1SjFpZoc8nWUW1VB1L+9Dw+cbicTK4E9KYlNmrE/PIt0L9C7yuHjjKnpT9PahpfUyhaptf5vMNu7+VVFimCnEVDh55Ip+83KAv5ou+VYgOv5Hg4lK3kBPqhBz1zOhsgr+mXZzv/ZOcAgcI84GkghnuwFdUDG3tQ50A7da1XE=</Encrypted>]]>&CircularKey;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fB3bJIXXvX/N1xBEOSKOndJqhC465QGrQZGKukYY8OQ10YLCnT6fKYl2aiNjuqWqxceDTUZ+kfd5JlxdtRu3mgaex1YCsbb23e9ufKNZ3F8qUygeykg+S9ku5rINn9ADa6UR3H+1m1dvfsUkeuEJ94wPoHSyigk4oZVye2EYVeQ2FIr9m3b2HaKI0bOQzFlUQ==</Encrypted>]]>
      &CircularScript;
    </text>
  </script>
  &OutlineCss;
</dir>