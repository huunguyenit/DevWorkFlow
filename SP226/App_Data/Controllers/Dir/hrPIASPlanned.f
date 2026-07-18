<?xml version="1.0" encoding="utf-8"?>

<dir table="hreqtlkddk" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin lương dự kiến" e="Planned Salary Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày bắt đầu" e="Start Date"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJIm3gqOxnEHloX558DNlvF5gjCsXZ7ApJJ00O6w2vrizPoj+d5BqX3FhcGal2EoXBuo=</encrypted>]]></clientScript>
    </field>
    <field name="ma_nt" allowNulls="false">
      <header v="Loại tiền" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" key="status = 1" check="1 = 1" reference="ten_nt%l" information="ma_nt$dmnt.ten_nt%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJIm3gqOxnEHloX558DNlvF5gjCsXZ7ApJJ00O6w2vrizPoj+d5BqX3FhcGal2EoXBuo=</encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="##0.00">
      <header v="Hệ số lương" e="Salary Coefficient"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJIm4pOxl+bi/rr53OnP1FaXez+k1+gSM1keOxpW+o9HVNwCHbWs7LM8SDFiq9QMjuQCoJAf4/2aN8vBV1iuzfhS1</encrypted>]]></clientScript>
    </field>
    <field name="luong_co_ban" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Lương cơ bản" e="Basic Salary"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJImNX2gmRNlpTCsvEIS9t/KqU8hm0dLq6Az5Yaf2h2hf0ZcWH6pn7HxxbLIlU0CE5AY=</encrypted>]]></clientScript>
    </field>
    <field name="hs_phu_cap1" type="Decimal" dataFormatString="##0.00">
      <header v="Hệ số phụ cấp 1" e="Allowance Coeff. 1"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJIm4pOxl+bi/rr53OnP1FaXejnJS/nb74MF5j0O9vpkp5Vc4Jq9HNvz5U1daoB081cF+kjgrceywKqJZpN/Oex8s</encrypted>]]></clientScript>
    </field>
    <field name="tien_phu_cap1" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền phụ cấp 1" e="Allowance Amount 1"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJImNX2gmRNlpTCsvEIS9t/KqU8hm0dLq6Az5Yaf2h2hf0ZcWH6pn7HxxbLIlU0CE5AY=</encrypted>]]></clientScript>
    </field>
    <field name="hs_phu_cap2" type="Decimal" dataFormatString="##0.00">
      <header v="Hệ số phụ cấp 2" e="Allowance Coeff. 2"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJIm4pOxl+bi/rr53OnP1FaXejnJS/nb74MF5j0O9vpkp5ZCYBQSHGkZTgtEDV4tDzP+H16X24cshVF62fwKSULe6</encrypted>]]></clientScript>
    </field>
    <field name="tien_phu_cap2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền phụ cấp 2" e="Allowance Amount 2"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJImNX2gmRNlpTCsvEIS9t/KqU8hm0dLq6Az5Yaf2h2hf0ZcWH6pn7HxxbLIlU0CE5AY=</encrypted>]]></clientScript>
    </field>
    <field name="hs_phu_cap3" type="Decimal" dataFormatString="##0.00">
      <header v="Hệ số phụ cấp 3" e="Allowance Coeff. 3"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJIm4pOxl+bi/rr53OnP1FaXejnJS/nb74MF5j0O9vpkp5VShi2PWN+Ch0r7JrZ0ogQEzFYhUbQId338teeujpofF</encrypted>]]></clientScript>
    </field>
    <field name="tien_phu_cap3" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền phụ cấp 3" e="Allowance Amount 3"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJImNX2gmRNlpTCsvEIS9t/Kq4jJCTQvaOs9wxZSAJYFK1XtW5Ufxn8kYdmmCgz10Br4=</encrypted>]]></clientScript>
    </field>
    <field name="t_tien_phu_cap" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tổng tiền phụ cấp" e="Total Allowance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfPrOQk3A0snDWLpjPItJImgIp61zKU1KMzR0sH5cn/R2sKM3JQmubpr9cVvNiziir5GG82NAJ6/YouaUKeW+nM=</encrypted>]]></clientScript>
    </field>
    <field name="t_thu_nhap" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tổng thu nhập" e="Total Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="ly_do">
      <header v="Lý do thay đổi" e="Reason for Change"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="ten_tc%l" external="true" hidden="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="luong_tt" external="true" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" hidden="true" disabled="true" defaultValue="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110---1: [ngay_bd].Label, [ngay_bd], [stt_rec]"/>
      <item value="11010011: [ma_nt].Label, [ma_nt], [ten_nt%l], [stt_rec0], [line_nbr]"/>
      <item value="110---1: [he_so].Label, [he_so], [luong_tt]"/>
      <item value="110: [luong_co_ban].Label, [luong_co_ban]"/>
      <item value="110: [hs_phu_cap1].Label, [hs_phu_cap1]"/>
      <item value="110: [tien_phu_cap1].Label, [tien_phu_cap1]"/>
      <item value="110: [hs_phu_cap2].Label, [hs_phu_cap2]"/>
      <item value="110: [tien_phu_cap2].Label, [tien_phu_cap2]"/>
      <item value="110: [hs_phu_cap3].Label, [hs_phu_cap3]"/>
      <item value="110: [tien_phu_cap3].Label, [tien_phu_cap3]"/>
      <item value="110: [t_tien_phu_cap].Label, [t_tien_phu_cap]"/>
      <item value="110: [t_thu_nhap].Label, [t_thu_nhap]"/>
      <item value="11000: [ly_do].Label, [ly_do]"/>
      <item value="1100001: [ghi_chu].Label, [ghi_chu], [ten_tc%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9NfuaG7i3j7e+c+oQhTXMYAxJVNBx0KLk1Xbs+Pa2K57CrU5QAXtcDtvNWFnOUl4EN28ippjMjaeWSegE8ruc83m3DnWBcDp+8BHegbiLET</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%PqkM3HnrVADZFaHe07aaRaSoDLWuk1fz5yC64DMhrjpFeM+TGtReWMTX0QHoNYG+d/Tt38Ai7KsqjNIpRVfu8YOmpdJyhkzN3XaY2lRRJ2LaRMzKtUyt22QBZXVz6lwRm0kTqN53/sl0t18YmHy/Ew==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1DvqYPEGhvkhcFFLA0md0CU8JCl3l8yMlhGiXpYo/WUCRwYNxEegCxDIiPCoxLSBNsOf56dn014yVVUl3KDr5VpIb5ZS/ciAbX52xhfzUnL0pTOkS3sAFpTLWxBcJkpP/lVYunKxh1s3hP6CpDL3NZ9fWNEWB2hvbHW8BZJBrc55X86mIblpt4pG2pCgkI/8AUs+ZcxfwPQZ27x7uvuSbYAYnO+PAXZLCdekwrHYWcPuWBg/Z8yfZU1hLiNIbInIB9+XJLmoQClMaf1gltMw0SI53H7jNXm+1UmIpmaelSajZ0PuiEkXbMc3cGHKTOHWBecIvarqDxLKIJk93AxFeLT1fv7C0yW37WeQuPclAajLT20WxdHL52yxrdBDwhBgLHsOWnkn559DyuPBHkks6RBT642NUqAkA7EhXLEJ2OV</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbRptsr13iekuFddlJY0mM2fK+oF3iRl1qC+7kUXOWfRbMJJ3FfD2ehqzYE9ZPEHqtRZcMnWjPHjLWCKBwTAJvxid7byGHmj5J16Qyn40O1QIS0ZKu1vxGBYeydMpGQgQwQkTi5bc8vMPVskB6crgAzLk8wrDhM8Dpfd+v/1C8xe4unbYKGnCR381ob/+Np3cO7bzgmRlt9WVOf06G/ErLGe9iU97mcYnB3f2LyNPW66Yg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nHj3i4krrIRNEYHuPn1y3sieIq5SdHxIyXrRGeS2/rQH9qQ5qpoDtWZKhpfluZQLqYEBRmsFErTYzMwQBCSYsQIy3MorSVpZexq9X9vBbx3uigAxcUjhd6dT50qDdUsSdzVrPepGMaiVoJhpraDKs2rqC1vPzA2myQc8/XhKdwalwNUMlVhHr3MiMARgQim8VwFlDViPvaUjOxyzHgaZQ8Mt/i/HAEGkluLitGuhROjlL+i2RRR+RBK40/h8WxcI/0ru74q/97DIYO/QhRWFhewo/WdSYCes+olQ8UP6HfVFxfOhMctX0INlbdsEUCisq</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6aBk6sDGBDHgaGthtV95WGfW/cJmTUbNUjPXb75Dcg/oG7mNRMmAWaaVi/p28UBA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cUSXeTZYZV+H7Fxc7qoNsKkTI3LamDgLUhmk3enSFtQdsGzwCh9fvXk735JeMyaAcxTcwAl5oEEPnEdoJB72c2YxL5uVRDidv1ZFGXihseckewqcIfePl3uwUIXdFDUclIf0G3qYmTx4QYAJGaknLrA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgZM3do1G6RtqacSp7r1ueBk8yIlkqtarHawSnpYHCB9OA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3mc3hfEbzZKoPpXNgnynMFJaOj1SgLT5M+Etwym88xFbUB8WuhlrMbx5mcUKye1lkxaQEsxn4iEPEp3MJIcHZU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%mp6eznZa11PdGfCdIfJZVrHyohms7qhUstWELJc5cTwqJIyrv8yjmGY+XAFFf4TeJRJsPLybE/kpYZCJ1hTjGwCFf4UGR5RJ9qx+5S/MSiU+9Oavntsq+nQ1whHjizVZHPSl16acXptXg77N72fq6cbQirYVpCZHrJ/z4Vg3wfSgw1aEv9jdAP0jnYeKORRRS3WCZuCJA+9WVIePoxf3D1VRNRIDP4yHAa2vAWIbIsuDAHoNn1LIY+w5y/XbLAeYAnY/4/9XoCeFVu219EE+XUaTYmRwv+hDcavdYagni9YY1D7TWL63dU33mp2nH2lOqbEu9pokl5GG6tnzdiO2PDIBRNBTdYpdPickRendpQTcHaNxu6sh+0NO0YNAUFanApr7jMhO5GDopUK3Fbg9GPiQugJ6IYylWap7DhA6FR73BzFgl70nwIcOokS8V3XVTAhtbCXwtbkRFQWEJV4fajBnH3ARChULASfv1EmxynZa+A9ojcwDiXHZe/RcjzmQ2K7oEnmJL4Q1lyZKOKRXwZoLeCi+TibKXdlxqRWIQbera07Ch54Rp0KK2KAGyNj4FGtXVxTlv6u9BLxCMyfZ3JQPGC+hEFFyqWNGJ7S9JtuuaieY2zkIygC0UzvAG2/3+Gc8MEUPE2tC54+GzpMCzslY7ZhYj/Ise4fBmDkNX3wYfqaT1LGzfdbUzgdvGjonusRwXFcNxxOBBBbNkKk7MNOeGD1pURBGq56VY/iYLKIKi/1yalUbH1sZUgOm0sKrk99wGOcAH2EzGXra9VSow03tI8G4C21N1X5D70bc50yUavZelpepm5ULVS7KAFGlbfQztrAJshSKS7aBtoK1jQtziQDYgJVqMyAcEiNMrK9vS/KMk7dMzEDNnV8rvjhsLsoOop0n/RZC3caj/H81HEZlMzwaCg1ilvaYMZcFsNI=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="MinimumSalary">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dflQzfv/pezEDIAzMv7+Ze9fBdozmh7Ur4Ja9aKMT4+IzM3NISiQp0+m8RFAF2DkcpjbnE8cgIKEQEjCz5zgTu4Vjpr7FTDQQxhxniKV7ZxpIVC7pGTaY/aykicHrrhNTiymdFmFDTCLvOs90ghKcVWh0HGRAgKcpF5yAI0APPp4YuaAFtwTqgoDxpVWb0jsAT++obhdTUICJ1G47IpgIddrXe6m6HSRA8hb6IDHt5J01P8Di5TYaamvuNGqSn1cMVidXbmJw0PaZD8ryXcMqHcm+TwmkqkRsJ680kPdMNvRwL3U/flrFg/j05UMWR/hOwsUHZD8I5fF2B11tkdZ6qxwbHs8O+Xc73NMC0i4g3e</encrypted>]]>
      </text>
    </action>
  </response>

</dir>