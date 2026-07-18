<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultForm "V20GLTC1">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="mau_bc">
      <header v="Chọn mẫu báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 100, 100, 130, 0"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Szzh1v0r+RHe4rlab/d/enVaG2NqHQIwT3LK3N6Rvv6a75GEdZVFD51h3opX53xeg/ZA6PTow7TDJbQjj05QLcokJIrkCv7ZKCW1/yoNyVO6tw7NLBpGFfsP1e0F/ZhsGdG+fKSzx8MLbQGModZeFRI9+fB9JIPaRwV46kRYO+FoBxHIibBNirowZiAV3XMlmTPFz3lHTxrwSZ1Oeq+7MzuBYuKvZAp05CNmk3yK8V/</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%aFAbyVXPX5GjVk6SkpZgUSh7H+W23t9yJtcKtjQs8+Rrb6ZYk2PQfk9TLTi30gfjNNz9z3z9aDHvnhBdHzOny+RRwgILNl7TqzEHoPiCPgZCy88NlN1Q20y3gSJt9ZHT9OqvLLYFjULcbz/daSGkws2eDe74lvS5VjZBgQuBeu8C1qmC2qdbxIPLM3rkWgZHkfHXE9lm/QDTAQCrJox+kXQZ7Iu7kTJ5W4tkug/qUpjHeYLlRCmuNqQrUfxjbxK1</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KumJQct0YUgCfFF/GYOr1bkCynaLjoFYBy0Xcp3kiywJ1wCY1BYBTcdcpxbVFWoV3zPj4jU/4w3rTKmYfC5FFteAVF8ZwLUhv7hSUC7C86n7</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4/COB/OvV9qf0TNCP+aqztpNVkY6nJ9UHjPE4FFx0pWO4nGx7oEKR43aH1ULYwTLbizUvSnpw24H79to2cf1VvFyiUvZ/pDdwCw2FvGfacUof2MR0gpnR6yqCcKe4J8u3j/HnLB6R/p/JOu+VSZerJePMom3eE0Xg2m3T/ZMHxDOIV1HZotNT/mAJ1g4y12MG5tSWrfRhBsTyBjPSZ62mDtq41rRbLVjHRTqf3mi3ZKzCBoEXJJqYS+pR4278LPZaSOLwpOGoWGslQtWK+/OHcRtx50ENq4eNv76Zb0ceoLlBDW+EefqyZRTVmgHzVUyxBYPGMzZgHq4yoJMrhm2PSmMR2tP4WCXpr3vFHrZezCr44zMv/QLROeX2JiIbzoFFy2pjGoqekHqF07FaRsg6WaL56BXxj232d7BT7kZSj4QT3cu7+pDUzpnbuY5R7MS8PatE1wcWPpNhpPAKIV/XgSwljA2/+yg99du9xwPtmw1FSwqtNS+OT7uL1WkIcTx1g2IeP5Rm7AUv2uDa/eI94PTS29FOhfzcwTX43nncEz80iirf+FiKLw7YNyYheuf/4=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>