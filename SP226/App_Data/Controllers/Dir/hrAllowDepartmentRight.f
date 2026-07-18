<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdmquyen" code="ma_quyen" order="ma_quyen" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền bộ phận" e="Department Access Control"></title>
  <fields>
    <field name="ma_quyen" isPrimaryKey="true" hidden="true" readOnly="true" dataFormatString="@upperCaseFormat">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;" e="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;"></footer>
      <items style="Mask"></items>
    </field>
    <field name="flag" external="true" defaultValue="0" allowContain="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="l1" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l2" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l3" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l4" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l5" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0, 0, 0, 0, 0"/>
      <item value="1000011: [ma_quyen].Desciption, [ma_quyen], [flag]"/>
      <item value="11111: [l1], [l2], [l3], [l4], [l5]"/>
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
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70EkGS9CT9F79CyUjVPB0tAB0NYoK7OnYa4AI1Q2ujox7ycqVwTtDQt4dGQdYiSsC6Xsrf3IRNaB9Gv2poN+A3H9tC7K8tA8n6dFptJ3y346HywOpLub7IjCGhSUQKDWcujnYw4GBYeEQotQJ9upqEMtFtgDUXbu+k2+UpaDLyKjut8P/qKd7xEb+l66gPjvEkvs8TLFqj1EwDJmrar0gsztJJL/hbkeCMtMMS9W+VCQw</encrypted>]]>
      </text>
    </command>
    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8jh3dBDkIwv+5aMcgRuajlghrBCPCPBIZTSMPfB8HNJYqBnyZf4V+W6S8cEsmn7ai6CXJ9j6zXqrntal+L0wLSALEXuSozxBEaQKSAJsnK9tyvCGzeiEUqNPcYTu3J3gMhEE2Oc+tX4+pDk8MvtpEmVYIazi/EzvreBiUy/K5aqLCXQxuUplwAGb/pp9tKWOonyNmLH2Dq2WOkBF84j3vQgengUXeAO/e2qNi9cz6dmhFjR4B5dqsk01OJZxpGwrlnsOXV24awn8hcnbPvsEYOM7rrWj6pgW1OAlotNZ6UcjXKhZOmvC6gc+pw1ZYfcHgWgdCbFNZQz4L31ZkUmKe1LPHGUpwB6aG3+XyQ8lboW+kizU8EsVE3EIwLO8b30Sw==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjnwXMVEQgBgd1hTnmRmEdChMlcgxnA8QUcipcbMlLSSMEg7FuHKeDieyrPuG33HqAdPU889LXPVhEDr0UL+QXn11wa2m5IubRm3cwNb8/IIdyIryWu2SKoz9aMrobxCdhEa0kCz8ZnNTIeX+7Mk/AZaGt2IMXBHwDOpN/hhAFx6GIcAjowdX15Z76AFbj1hP7uB6Y88+zzaQadJenVRtcmhW3eHa1kahAvSd2FOmncc8WhxoYk6aUfSav+K87oZL/8fjLWd9L/V1Q1KR4/osHP3JeoQyeQVgjS6XPGww5WctdRkQzy5aF1dFTQXh9IMcYCb7h6hpHa+kptZoGfi1KPpw9deOzbygLRKcLchbgjQFiZudHCGgcXWSigKXE60jyE2De/xezF8Pw7fOpclykw6uL0R9xmvlLIbO61A4KYMHiis93MxRDddRBftJknV1llRH6y/ZZexNP9YMyER/OVjdxlPedEmUeKORslNTTzOsVV3OJqp5+CCnrCmVVbDWUsaXewXXKYRD/Rt/raMbMXGecOXiGty7HNrV+QkG1BJd7unMa8WIQ3eC6B/Z7+G44Yurxt6CKqYB1kOHHXJTd1Iw5eViAIyr/DIEqHo6uNF3NhXNSSAguSxL1p8u+0gPRq2mFbJpooUKhU2A1L+Jy8Xb3m9eJcC8M5L7OLELYhBgg==</encrypted>]]>
    </text>
  </script>


</dir>