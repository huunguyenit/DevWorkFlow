<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdmquyen" code="ma_quyen" order="ma_quyen" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền chức năng" e="Task Access Control"></title>
  <fields>
    <field name="ma_quyen" isPrimaryKey="true" hidden="true" readOnly="true" dataFormatString="@upperCaseFormat">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;" e="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;"></footer>
      <items style="Mask"></items>
    </field>
    <field name="flag" external="true" defaultValue="0" allowContain="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="r1" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r2" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r3" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r4" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r5" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0, 0, 0, 0, 0"/>
      <item value="1000011: [ma_quyen].Desciption, [ma_quyen], [flag]"/>
      <item value="11111: [r1], [r2], [r3], [r4], [r5]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/ckpAo0/H/URcTCmqyL6SELW2rrMvAvGar3RqvUzwXQkLEmS75PrZW5gYmlOkVIkT0BAagbOUlctCKmz7kQM8euR90xwKMn9acoHtJ/tfE0RTMHwg/W0nsIJI5IoZt++Q==</encrypted>]]>
      </text>
    </command>
    
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Zr2y5pKQTNobdB3ru1GxH9EOPDITmfqYvcXhQn8DwvKul8pVp1tvRRPjI98q8ZdBvMW1yTIyx60lp3IirH9QSlx4rYbRyzrffjgirLE+dHGNuGoJBNx5Vr4Q/Mc1HfsJcDpUP4fdaOLEQfusZf0+DI=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf17SB624yUQlLPN9Ubj+9HwdSdd+5+qRrULzRJ4h8PlYaxd71HU72GrP4ApdfvtMvvNxeQ/aDBt3QE2f3fLTSV4=</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BjHNtpeQ/hK+cDSgRPhUaaX17l1yBVeufDQIazcSO/hgTE2ZBaUsQWAlGODUsP5W/ju72jV8Ucsf+Vc9iTzTFNu1JKPOlk8HrWwj/WCaHVErCR/QWpH5ZHnStHggBpn9O+hnwuKTjj1J14caowJEYagY4bECENcUW8zHJE2Fejc7ae/+BMT1IIwxYxlEmLBjwqt5KKQKgbR7ftHbKVCajVwVJGXINS3U9iMCc2ULHS0</encrypted>]]>
      </text>
    </command>
    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9R7HUUwtT0Tq5/bBTQeS/AS1E177SW3tctBf4LYuoZAkbBwpqOpzJKBVw5OHLQ5JzYBepMAUKesYbNekYqqaAGbitOVgg8Y22K9z/2Nu1ItzMRHP2p20akV7yiXxxuR8/qDFJrQPP29jnyvR7J85Ke3hFX37fCnGgqTnvFJmguodrAGtV//KLpgKqhBqpO2tn8r9VRccXHkhFKjwgruzL3+C4VZ1QGE9DIpER+Sp4WStKnPPKcJy0uuRMzBE6727mOE+DfBjdOdoF0nRk2R+koGPVrBHZE0HWpgzQgh9/p+jRsxlvgaxHk4hY9fZlQv8ug+T5cn3hozrH2wRoqMMTDI2bD8L5rco7EJxszykDaB411ewkD6kvr2IE+u437upQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%dUxtAbG76hDnHEpXdcWHx2Qs+0tWXconatdmGK9nADg=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjnwXMVEQgBgd1hTnmRmEdChMlcgxnA8QUcipcbMlLSSMEg7FuHKeDieyrPuG33HqAdPU889LXPVhEDr0UL+QXn11wa2m5IubRm3cwNb8/IIdyIryWu2SKoz9aMrobxCdhEa0kCz8ZnNTIeX+7Mk/AZaGt2IMXBHwDOpN/hhAFx6GIcAjowdX15Z76AFbj1hP7uB6Y88+zzaQadJenVRtcmhW3eHa1kahAvSd2FOmncc8WhxoYk6aUfSav+K87oZL/8fjLWd9L/V1Q1KR4/osHP3JeoQyeQVgjS6XPGww5WctdRkQzy5aF1dFTQXh9IMcYCb7h6hpHa+kptZoGfi1KPpw9deOzbygLRKcLchbgjQFiZudHCGgcXWSigKXE60jyE2De/xezF8Pw7fOpclykw6TIw9AqMyOMyic780F9gJIqgQI7F1aATyWrNBsTBRGMqyg/akEa5eWRabnOt+u701DM3DVfMJSpIOmWDEusoUsBKG3mangAPVJO3Sey0clr9BQxjRoCPP+hzk0krFcjJBqrtw5ebqw2vRz/vtlTB6+mFVT4NUg6A3Y/U/iQtVZFGRZkadTCRT3It7VZTTr2sBefP5k6hwcwcCg0V+46ptq6VNsJJaQFEC9XfzhX6t/gI=</encrypted>]]>
    </text>
  </script>


</dir>