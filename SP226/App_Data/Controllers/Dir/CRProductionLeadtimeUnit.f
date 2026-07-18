<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY k0 "@ngay_hl = $ngay_hl.OldValue and @ma_vt = $ma_vt.OldValue">
  <!ENTITY k1 "ngay_hl = @ngay_hl and ma_vt = @ma_vt">
  <!ENTITY k2 "ngay_hl = $ngay_hl.OldValue and ma_vt = $ma_vt.OldValue">
  <!ENTITY AfterUpdate "
declare @rate numeric(9, 2)
select @rate = he_so from dmqddvt where (ma_vt = @ma_vt or ma_vt = '*') and dvt = @dvt
select @rate = isnull(@rate, 1)
update @@table set he_so = @rate, cs_qd = @cong_suat where &k1;">
]>

<dir table="crdmtgsp" code="ma_vt, ngay_hl" order="ma_vt, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="định mức thời gian sản xuất sản phẩm" e="Processing Time per Unit"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1' and loai_vt in ('41', '51')" check="kieu_hd &lt;&gt; '0' and loai_vt in ('41', '51')" information="ma_vt$dmvt.ten_vt%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OYpfUB2/k33ezut4X5BX2aQ+Tss+1bs9rJx+za8T3bHRgjSk6yIrmv1XEC2JMUHXQ0i9B24VYuy0i0Ki97imvg=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" isPrimaryKey="true">
      <header v="Hiệu lực từ" e="Effective Start"></header>
    </field>
    <field name="dvt" width="100" allowNulls="false" inactivate="true">
      <header v="Đơn vị tính" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" readOnly="true" external="true" defaultValue="cast(0 as bit)" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right" allowNulls="false">
      <header v="Định mức thời gian" e="Proc. Time per Unit"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="110: [cong_suat].Label, [cong_suat]"/>
      <item value="110-: [ngay_hl].Label, [ngay_hl]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDDsjuffcjxmy6pKI5ldHVV3epbtItUkiK+8z1QaSJvRHm6Njvx2yBt+W1Mm9CHh+mUAbNgKG8Nvvi21L4+YGThD7EXyNiTdO+Yq1FrGf8xS</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFOHpGvSDW3YPuIupMVgH8RzLKD+jlKo+BTkMeklwsIODVN/9eN7OxOftyyU00U9PuH7kyMOnRgj2CUqXTOZMjeSiQOa6whYa9tXBc2AnuHs</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFYDq6+fwx1CmBhFGmjt9QiIh1Q20nopA+aQE4yuQBkjjaY4HGHJETVvZeEPV+dkU3YW2o1iwJMXMDWfCuIAh809kUfj+nAg56E4zdAr/qWb</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIXaVkhFh0moy2rQ1Jd6JtksTmn8kXKTn0WCu0RyfreNVjZNQ827DYesaWJ/sh5m09h0O30zI9Z0VUF15cQRvU7Bo224cEAkeqG+a5ZnFnJ79REYnVW6y2A6m5nftZEYJBg0rcKWA5hmuWEIaR+kKbuNyxRcw8xo/417wVXzuC7omPC8O/nLu343ueGjSTgX3oRP5sDrFfybscQHmhZ/NkOt9reJlVdM0eLublszCk+O6bZpGvB2n7EIm6MFuYx7fZ3UHv7GYjyl9mTCHDPDNNvvAsEZV+32Hsdkes0WLOlPddTHsr/ZYTV5/U/UJ/nJz1vYwD83ZgW+Cm3AcFdl8lOAQC1DgKSvPex3j21Y5ev1Tv/JPVN8b3oToxLUObtDo7dFlsbq4GPCdOic1U2PpU9T6Dq9kiap0Fdn4WYAU6FRHOSECUVmMpDxEjfTc7kKqpiIyUwJYf9vzgYC8bR4Tj7w==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz+GCNnCd0WVMMoNOHbBqVDxSYOa5frG4oK3eFqpGE/zx7P8g2hE7Xul+KT84Kp51inRLVHlKSQpALvNf9GgBMxxGiY6ecspykEfjTSm2EuNW9h+ElDbZlcXsn4u45kXitOuElGDlnM1l+JB8b95ZTE=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqQkA+CAc0ekwifZZLEvnfA==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUO2W9aiQTkPy96RE7VCMEY1mmaB3UsfOKR3mYMRlF7XMYlpURP5kL/KI5Mdzo7/xqW5YpdwGzV2Z12WA/2nERJtttJvIsUw7yd1a7vvPca8w0GyH++94kYOWmv8MBnULa40iG5qR9rXiVuughs29VDYEwwUUEOecWn/D03Xv0pTj7p60chhs4H/vGwkeW8DBItytC096ZNSjUS9HVhoAy+oQ/vSoj1dCLCBtptgrj0edA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteUI1QmUgP10yHksf+Ca1iWw==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUO2W9aiQTkPy96RE7VCMEY1ZCSf9tWwPKJ+goD28fSMbocd3VzOAgGECn3MFv+a7ncasVRIlMNIIQggHOEOQsy0Z5GheVjPGrHnaj2unAfN8wOnqE8pf8NtKRrOYfYuMmn1sCY8YKOa1dwxNNTF9apjYqboqjRzGs0yspCjX6rbLqQh4jvwQCTh0x7ugMwb6F5QtYwBofYqR3Go923trmzr</Encrypted>]]>&k0;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMVZCLu0/56nviMMRE2b0t5VXIS9FErUnVAIrYHbfYuSE=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&YARH0qdfPiWP620v9FAeSPICrzWaA8H4buAdoshnAjQ=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6+iSr8HCVbXk+kp2q9xQCyo8Qix25f6ADZ1OFKBXUlJJq5o9tYZnihGir2drU63ui7spXip3qQQxGOZijLgkCcSgm8Qv2KfpwFGkqRgm54lVM1k0iwF6jxmSjv2MQeAjcTDskmVOFIa87AlksEoUGorPJ9depsV742plTU+yZSI7ki0EgDdZFHXUmGpagpkRDZpXQK7r7LP6ALGbGnddydo=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+ON7PtGJwPs+Ue1dhk9iTEMusobpy/mpGNP17+b7z99</Encrypted>]]>&k1;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &AfterUpdate;
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtfQRHAy/c2ay+nPIZ+iu1VmRwY5oec20A4gMphyWRvoYtxrimfQS4Z1m0HaAohrNziKxfxujHsONFLkZAu8CUODZjM6dicZjCX8mHV4z5L6z+VsUuclLSPw/XZyBCZfAcoGMhMxj6yLmz2/0InSQryQ2z9pdO8k85wOK/WY7/aIipVrhJUE/OsX70kClkve0jnE6DLlaIhryaEp738yy0BWV02wtLSBdrdKhXUEXgwzHaUggNHq5XQocNGieqhRjz5Gq2Lwv5FAg4h/8O9vjJ5KdgYa7CYnj0FH/lyDNDa+Z6Vxe3+wjUf2pcIYH824gT90zzHdCBpZ9RuKfL7pgEh47vc+xQWoJgdrT4Na3WU1o2OnR2wEzxEDd9uke3DRQZdoy9zQmsqaqyhUSi7HMswvqctKVywrMu0sNvUZeK1EcOwC171YTGGYWLqgNLPLLGE6AkSnkjQrZlslmeN1opjP9OhhFXOvdOgW0YdMbMIQQMo2+1D2hk7owuWiwGxTtIq6YNE0TDSunSSZyadRUlof8wUOUk48gnK2tfyRVU9jmYPwzPmvEuTpXROwbiFmfek6vSWDr/j5gyWIbsZ5zikY=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXNIu1i9vLplAyNQLu+wb4QUTjHz85T5go0iHoegrpQgsx6MBgE6nKDt9AXnIzRvH6767FKu/b2rfih1zwvVkVx0x80Qn7ohfebMTW2aoWi30BvZLBGPrmgzfQAr2sYjBQw==</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>