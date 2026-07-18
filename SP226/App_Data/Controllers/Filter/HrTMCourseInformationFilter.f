<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "hrTMCourseInformation">
  <!ENTITY c11 "Yêu cầu từ ngày">
  <!ENTITY c12 "Request Date From">
  <!ENTITY c21 "Số phiếu">
  <!ENTITY c22 "Number">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'hrTMCourseInformationFilter', 'Filter', 'hrTMCourseInformation'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="hrdtyc" code="stt_rec" order="ngay_ct, so_ct, stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn yêu cầu đào tạo" e="Select Training Request"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="&c21;" e="&c22;"></header>
      <items style="AutoComplete" controller="&Identity;Lookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_mh" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11011: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2], [ma_mh]"/>
      <item value="11011: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpe8Vy79+SdLNdrEyObtAekAsL++pyqgWA4RX3IZocbr27QlnE/kUeNDaFU4DIoXlOU3IpQN8ceWGHz70s1p9ir9uYAOe6UUVP0VspCXCVijo9vP0eA5f2J8Dh/b4EGs0NbMqYOjoHyRmXkh0DhdhoSSXFp8rQ8hmQyN8RaC1wD/HRDcpC5LMjqRNlfOA5QjiA5Z+3c5uSYgeqLf62phaUHkdB9swJgDVoHw0U82ZDpYvKRJq9wEUbm+P3CLqo6L9ubT6Zbf81B0U0GLuaTzvPc7YJtAlW/IIQimEgX7uAKHQ9u10Zc8XHGZRSXd07ffHwA5QhQ8Ke/8soBTjzw4ZRiA+PIomDs/pOlNql5yLdadtg==</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KU3qC26YeKeL7edhfPrfpCg/YTTJdjFCOs/4qPMwV+fShss9wW6Cv5nAulvtCjAwAtl/ReZoFCnUqfyeYjTcyNMisLWWTTd9WSddX7Phq6NFaVgsd57uyKEsh7OrAb79DD5dE/5Jbh6MhWRAbQffyceE4evepDGNlA/jL1GVLO9qLwYS3bVHCOTqXfLV3GLk4SQHDCkhmrtSoiaIx9/oiISvpP7wgU3QRCa9bKDxoYvlrlDHA/hY17/W2LHtdYrDH8EMqx4wjTRpr3mlwHJVy6Vedoh+FARfHef2iPb8jNgO5doXvJIa0iggJIA5MB3rZuth7FEiuQsBZNW7BVg7+D9+5QtEGO0HWl2d0kLGa5Zuo6VNmNcrdQ60Iy/W0qvmhYBaSbuAetDKoouPqUlfD+8QVrUdAYnAnmI2x/Trslwm2g18vWoQlYBTfUbEw7DBjhQMIGOs9HQV+qI/QAWqq6MNp/Xg/lviIY+DailKXBzQgoj4AljWJb80+905ihStlU9ZmRdf0+T6rBPlbk5fbQF6jgGrBaHYg6kgO4AVnmNGKJJfUtUADRtQrr3oE/g3+I8KCqmlK9yizWAcJCwEdDkMiXq86kgHIbkKgS2ft50oDG4CqhLQDtyJDWqWI/dx/aVqgPoWN/t+Dyo/jvOMrMUfsB92TJOfNAKh7YfGjI4aUKcvJjvnib8+Z2WLe2a2OVrAJyroM4POSHgQjZS8SkCxe41B3vyAIlEkLdhYKHyskUbLZ3Z0SXmdjYsbRdmRaZoMxVixIArIP9jxTfJtotOShbP2yH2aHHckX6UhiPnmzL85okDT+poLxDDRvdHVJqASQrmdz8l2zYbGyjKBg++RQlfUl1UZtLwH5aLPlrEXqm0Itc2ab0KS9bEYwujMLJjOTk3m7/Ytb/TpZX/OjWhKA7V7OOAUnZx+FJmIy9LjF7dEWdaIL0qyba0G/dbk/qc9g3t7lANDJan0H1WIHUNgeY+MMpjsSi9UuhtIowfBPPIv+GdV2SC3OrzVFHVF2QvevgPRJCl8KbWxk9vl8=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIFuWhFfGwAduO+uG+CZheu7v8Md/DB/7K4gO10NsYIR6X9W2xD2NJwpLSOWpo8Eh/oQ0fCIypCm8IX8Y09pYequ9Kmkk1mK5f+8yoqAVAd95DIIe992X4dNlJM2OEr7MyDzZ6CIDRFiwGTYehho8US3GwSUqUvVpcjVRzVXpAnzQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWKciZtO3jhZffO9EJzsdj9EsiaBUE747e//3RnkUwb7Wp7g+V9Raf23CaYJ4oqqB8ywXXz7fWEI4+F4eKwQJqXAU6Ct664goOaS4tzD1aCwHSQ7ZhLBMZNHXuSy9JO9O+L42AJGoq4iVbldwW6nc8SwuVZiZeKzdYzmMheNsiKry7rqmpOKC9s7jz4sIsduT/L81ro20W8/IPyqJRjdkDa3CPhBARjzZFSjGJ5+vZUkfw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3qeBZQhxWm9N1jRkDfSC40OHkd2DXY0N0S9OSWHXjUiFW+QJt4fV8dVINzErNnhRZdgmMtp+5Wi+CtdIuC9Swcw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNzr5CBr8L6XnwsuxeQoiUffsWo+UJaxSPxz5Na+JgujI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOsJqzxLceRuHfo9D6kOT0XwaPBsyzGrMdWAqrJMp+NB9QvXosSKDoMDqD8DZPtykL4zyQ+IBr7Th4xaMEQ3/JcY7PchsuFknwCO9ujANrfGDwvqK7Ks1dL1lzfvM9hynAazZFUfRL1EufCrgLStG/+YrwO2oMgvnz7Whdh3DJmOQNbNHLSPjcU2jlUj4+oYDw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrKMYCHssObkBLe1+DexzOpe5lULK1cFZqpupY1zLddAAhYVNkkkwzOx0iC+UZwZ2HH6tpF7742069kbRbeepWMK2K/444lS0CTrzN6XcnepoBycKQCyHyEAvMaFI2kZNp9Pb017inyiRg1JYXDO10Mo7WMBa5FO4Ni9A3IdpIgMsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaH/CtUuLy/hvt3u8Bvftrye0XvNf0rLnyjPSKspRBurHg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sVpitp0+hFILyKfrnwQpCmVQKG08UnmtL+roi6QO9FKOA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/ymZ9l54qC/L2yU4fowjEL9nmGanANZheBzn+KFNsg/pYOoPyLmPCpOM6hxBX+OXtw==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>