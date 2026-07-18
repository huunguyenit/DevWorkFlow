<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="vmdmlichlv" code="ngay_nghi" order="ngay_nghi" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 330"/>
      <item value="11--: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsALj1aTNQ81DM4zo8+5r4+RkAAqLVdyEAOKcMfBwdRFD+rtxsktayhHZFyCABUTu1f34fBOtgvbUyekV/57+S2xyHcknKCtLxzaEoIk96zngM+EbtiZ6j1XbcqgF0HzpwEBFbj6kf1ED03D2BFLPU31tqK9eaFqJfDxRLPC94aljwInQ4Tv05cefqYYRU99NBbQCKfGmL2Obv+JAablsxDSfGKpM3mqrGlSUE2AC45RswW3VQoirLB1NUEt0Gw80gPk+el1DzFZroY+EIOmjOLCICZHmkkP4lDLxvjkAsVA+V/qTeiPHXYvz6tYUeorHapFbxwDHbaAOABulXYLNJM8m7DR9++upz8l8Zf1SVpUdcTIw1HS4MDlIWO9Hhou1IhTvFIk4SAqtyE1KvFijObusGHnztCKCTYzYQdxdu/xKiXFhsgc9BJp1HFLPszz6Ns</encrypted>]]>
    </text>
  </script>
</dir>