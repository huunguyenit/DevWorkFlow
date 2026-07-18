<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % ManagementObjectTransaction "INCLUDE">
  <!ENTITY % ManagementObject SYSTEM "..\Include\ManagementObject.ent">
  %ManagementObject;
]>


<dir table="dmpb1" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Khai báo chi tiết" e="Detail"></title>
  <fields>
    <field name="tk">
      <header v="Tài khoản nhận" e="Receiving Account"></header>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_he_so" external="true" defaultValue="''">
      <header v="Ds tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_du" external="true" defaultValue="''">
      <header v="Ds tài khoản có" e="Credit Account"></header>
    </field>

    <field name="ct" external="true" clientDefault="0" defaultValue="0" rows="95" categoryIndex="1" filterSource="Tidy">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="AllocationDetailGrid" row="1">
      </items>
    </field>

    <field name="ma_vv" inactivate="true" categoryIndex="-1">
      <header v="Mã vụ việc" e="Job"></header>
    </field>
    <field name="ten_vv%l" categoryIndex="-1" readOnly="true" external="true" defaultValue="''">
      <header v="Tên vụ việc" e="Job Name"></header>
    </field>
    <field name="ma_bp" inactivate="true" categoryIndex="-1">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" categoryIndex="-1" readOnly="true" external="true" defaultValue="''">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="ma_hd" inactivate="true" categoryIndex="-1">
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd%l" categoryIndex="-1" readOnly="true" external="true" defaultValue="''">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>

    &ManagementObjectTranFormFields;
  </fields>

  <views>
    <view id="Dir" height="155" anchor="5">
      <item value="120, 30, 70, 100, 433"/>
      <item value="11010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1100: [tk_he_so].Label, [tk_he_so]"/>
      <item value="1100: [tk_du].Label, [tk_du]"/>

      <item value="1: [ct]"/>

      <item value="11010: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      &ManagementObjectTranFormViews;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="120, 30, 70, 100, 433" anchor="5">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcE19oancTtwbafwKchr1QcqNqiubbg2xSsZWNClOP88sRHRwh5KuVfWiLnaHaZGBKT+ghXKQW9vB8Vj9bm0qllE=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcALxunnOLRR+NR/8YqMD4asMIWSlHH9HlzZtWALRghZt8fKhrG2k+bxV0gdJFWoO9qJnthXVMz4YDMw6fuW+ELE=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcK+bk6wpXd4i8JCoC05ZmgslLG+qL+5ju5HYdObamnFng0qGbmNNPBYtPPNLK16no7G/XkLzuKieDxN855yD6N8=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTikGS0ytaUJNptjRQwYJhO8EEWK3ZoNB/IIu1vt+rAeckO5ZcJjTQWXqLnCSVKVrtDZ4nn26IQmyB52z0r/+gPV4fuR73pIbX+pnH69GBMOXJxd14cqpyMNSWLcd+7p61jO6RMtrAd9CmnSK14OFgeQMtELHm0uvAemtY2fryfvzucM+woD5svijkEEaftDlAcW4YkXckhAmCXavTI1PhFa54/RNYTzA7aPGP+hNzlPr5jlJ+mNK4nqMeaytWAZQ+WoDO9cD4iFTZMapLz/GVna1jaJrPrvDScBc1cP4eolMEk4JlLfIps0gAUzz1+x+JjFjbPvK6IqV2UbCNV6lIgJtk/OI4/XNYgnkRej6ciAx4UVcSeRqBDzJmy+2kD5AFmJGcYf70FSLY8K/j+q7TVNC7O8GcbUf7mEZGuEzc82/ZpGkIS3XUzSNMKzjc1YzYCfBx9jGAZHal3BtzFP125d1x4qz3wagF3ubua5rjz1QM0u9WkbcWjcvVXte4HKIp+L0Is8UDowqgNIQUnUUxqRdz8iXR3nw42GJkyXh+FkJT/8dt1Ftpc5MxKb397wGy0FVQ4IVMCM/r0XuR5mmL6Zt4tTy+HU7Ka41gx4imBNlqbuFYELu8F3puXmDQsiVw/Dp50lfRoLzKm8UO0hzD/JCoH52JIgO5os2afFYNT0kK2u0gnKAnlxclECWMZknKHlOaxWJKhNJJGpG+RJPgTUH6IxCS/ObELuMXGScTKv6A+lJQwq1+qK/XMrxuJx4FXtOVk2apZ08/FdSBpANYUMjLvFRTlPkWEDOxzd9PBo8vLwJW+qqMHnSWq6a5gAeGOxAgJTXSASvcho8FiaLhHOJULDk8/Soz5UZzRyXEdlzomCPrZHP9EGUbgufiIWeYQSNFDy6nj8CaRCEaJBEBSRm4cro0R7qPWQmTcesi7Qd/gvKy3orLTR81VVki2k0NH5ecEffOCWw5MlnKk1MSGU91nzN09iBeUmpREE7LNsZ0OMdccWWYsNZaeEdHseiXc05tODaEEEI8ZUrWA4ZLEpP5dOceGQONdIxu9D5W3spwiwAb+TPGnoEq8knv01+greCYCEHL4FaiDWQSbfz8OpSnAghrVw3WjpzCng2f5oxUm+9Gkc/EwnxBnGnMPsqKFuseF4fPofvj9YGAApOUft7GWEIY34qLVqIo+6TRSTUw+lnqTDhJWS9LYLWrpF6fZyyaZizlT/tjjdk4C87RLONQZKDat/UduwOHZF4eOXuEaLRTJ1F0Zs+DBE45furFqlzrieSe7PvuTldceXKFzIZ53f1yzUEM1YzHYMHQkkD4vIOvsR9awvwA8JFSeMfw==</Encrypted>]]>&ManagementObjectFieldList;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFAlcXsBAVmmDbjHznETdMFWL0KnXNvmHfSrC9+QvOvuqYHKhHhIoO/y2kbZLy2bcxn+UqsHFpa99CRELutoj/no=</Encrypted>]]>&ManagementObjectFieldNameList;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunLqwmoiSR1OTN4d73t7m5R0+iv9y15ot7KVJrKJFyMqU1crXteJbCkfu/W2joc/3HT5xmhInTLIq52vTZbJgZ7TOw33Xtcb3xWRCEboc2bqnRU7UEAR1XEeBuDieWOpymUWNairmMX7QV7pRS3hx6q/NuN0i5219TiC68ZWm4YtMrNABRRrLWPJJ4Rf31yssLu++yv4RVnt/fjx6Gl7unHU=</Encrypted>]]>
    </text>
  </script>
</dir>