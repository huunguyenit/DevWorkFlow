<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">

  <!ENTITY Controller "VoucherBookTemplates">
  <!ENTITY v " case when @@language = 'v' then N'">
  <!ENTITY c0 "select @n = character_maximum_length from information_schema.columns where table_name = 'v20dmnk' and column_name = '">
  <!ENTITY c1 "'
if len(replace(replace(replace(@">
  <!ENTITY c2 ", '[MM]', '00'),'[YY]', '00'), '[YYYY]', '0000')) &gt; @n begin
  select '">
  <!ENTITY c3 "' as field, replace(@$fieldConflict, '&#37;s',&v;">
  <!ENTITY c4 "' else N'">
  <!ENTITY c5 "' end) as message
  return
end">

  <!ENTITY Check "declare @n int
select @$fieldConflict =&v;Trường &lt;span class=&quot;Highlight&quot;&gt;&#37;s&lt;/span&gt; chưa nhập hoặc giá trị nhập không hợp lệ.&c4;Field &lt;span class=&quot;Highlight&quot;&gt;&#37;s&lt;/span&gt; must not be blank or has invalid value.' end
&c0;ma_nk&c1;ma_nkt&c2;ma_nkt&c3;Mã quyển&c4;Book Code' end) as message
  return
end
&c0;ten_nk&c1;ten_nkt&c2;ten_nkt&c3;Tên quyển&c4;Description&c5;
&c0;ten_nk2&c1;ten_nkt2&c2;ten_nkt2&c3;Tên khác&c4;Other Name&c5;
&c0;so_seri&c1;so_seri&c2;so_seri&c3;Ký hiệu chứng từ&c4;Series&c5;
&c0;so_ct0&c1;so_ct0&c2;so_ct0&c3;Số hiện tại&c4;Current Number&c5;
&c0;so_ct1&c1;so_ct1&c2;so_ct1&c3;Số bắt đầu&c4;Number Start&c5;
&c0;so_ct2&c1;so_ct2&c2;so_ct2&c3;Số kết thúc&c4;Number End&c5;
">
]>

<dir table="v20dmnkt" code="ma_nkt" order="ma_nkt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="mẫu quyển chứng từ" e="Voucher Book Template"></title>
  <fields>
    <field name="ma_nkt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quyển" e="Book Code"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="Mask"/>
    </field>
    <field name="ten_nkt" allowNulls="false">
      <header v="Tên quyển" e="Description"></header>
    </field>
    <field name="ten_nkt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Theo tháng, 2 - Theo năm" e="1 - By month, 2 - By year"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NtysGKANauXvU09qoqGeETNEVJM1MGHbPgAGkag47OO</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQup/8QPyK2MtMQ8grcQd5vAaw5wJ34kpaYylFKcRVnIWh</Encrypted>]]></clientScript>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = 1" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"></items>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ky_hieu" categoryIndex="1">
      <header v="Mẫu chứng từ" e="Form"></header>
      <items style="AutoComplete" controller ="VoucherTemplate" key ="status = '1'" check ="1=1" reference ="ten_mau_ct%l" information="ma_mau_ct$dmmauct.ten_mau_ct%l"/>
    </field>
    <field name="ten_mau_ct%l" defaultValue="''" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="so_seri" dataFormatString="@upperCaseFormat" categoryIndex="1">
      <header v="Ký hiệu chứng từ" e="Series"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct1" allowNulls="false" dataFormatString="@upperCaseFormat" align="left" categoryIndex="1">
      <header v="Số bắt đầu" e="Number Start"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OgwDh+gV8CsO+N4xOSoYivy+bqMVhEVNy3967RqdWHu</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uPk3THcgU1TSBZoeIguG21TLHCBs9JA3V3gXaRKtAAfIKYYlKItc050+bXFPGT11</Encrypted>]]></clientScript>
    </field>
    <field name="so_ct2" allowNulls="false" dataFormatString="@upperCaseFormat" align="left" categoryIndex="1">
      <header v="Số kết thúc" e="Number End"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct0" allowNulls="false" dataFormatString="@upperCaseFormat" align="left" categoryIndex="1">
      <header v="Số hiện tại" e="Current Number"></header>
      <items style="Mask"></items>
    </field>
    <field name="trung_so" type="Decimal" external="true" defaultValue="'0'" allowContain="true" categoryIndex="1">
      <header v="Kiểm tra trùng số" e="Check Duplication"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0 - Không kiểm tra" e="0 - No"/>
        </item>
        <item value="1">
          <text v="1 - Theo ngày" e="1 - Daily"/>
        </item>
        <item value="2">
          <text v="2 - Theo tháng" e="2 - Monthly"/>
        </item>
        <item value="3">
          <text v="3 - Theo quý" e="3 - Quarterly"/>
        </item>
        <item value="4">
          <text v="4 - Theo năm" e="4 - Annually"/>
        </item>
        <item value="5">
          <text v="5 - Tất" e="5 - All"/>
        </item>
      </items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99HXe3/5RIWWIWwzSgTSIqobcc2QFk5qP7R+VJYeNS/9M</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&49XlYrbrIGPDkf1APylPYTYug9YUDDtfdvWvIJ1R5THkA+dPaizQ9lbwBiE4FhvFZkjq1bbHYlCOURoHIxU08vCGL5X7FR3FjajiiaeGEAHwX+7ofSGj5rAyu218sqaH</Encrypted>]]></clientScript>
    </field>
    <field name="cb_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="1">
      <header v="Chỉ cảnh báo" e="Warning only"></header>
    </field>

    <field name="v20dmctnkt" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="125" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="VoucherBookTemplatesDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_nkt, ma_nkt" e="String: ma_nkt, ma_nkt"></text>
        </item>
      </items>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="ntype%l" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" readOnly="true" defaultValue="0">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="185" anchor="8">
      <item value="120, 30, 70, 100, 25, 25, 180, 0"/>
      <item value="110----1: [ma_nkt].Label, [ma_nkt], [tag]"/>
      <item value="11000000: [ten_nkt].Label, [ten_nkt]"/>
      <item value="11000000: [ten_nkt2].Label, [ten_nkt2]"/>
      <item value="11100001: [type].Label, [type], [type].Description, [ntype%l]"/>

      <item value="1101000-: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1101000-: [ky_hieu].Label, [ky_hieu], [ten_mau_ct%l]"/>
      <item value="110-----: [so_seri].Label, [so_seri]"/>
      <item value="110-----: [so_ct1].Label, [so_ct1]"/>
      <item value="110-----: [so_ct2].Label, [so_ct2]"/>
      <item value="110-----: [so_ct0].Label, [so_ct0]"/>
      <item value="1100-11-: [trung_so].Label, [trung_so], [cb_yn], [cb_yn].Label"/>
      <item value="1110000-: [status].Label, [status], [status].Description"/>

      <item value="1: [v20dmctnkt]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 25, 25, 180, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="3" columns="566" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4b0rGa8vBKURt7mg7V/CooFCok56BnPzkFdxMjMZtmCyDF8MRbYBtz6m5qsA7DOMha4NlYZ+24u8WA4DtOYm876ACCyOYvFnXRg6srP+YjEg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQujnJ2T7LpIUAXtDOKavWoWyrdqm6BwbFUeK6de9ox7r5l80gRiRrmrJKsAH2BMekHw==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1snEZ3LakEidUn95J9J7azInKrNJdN4TSuMUDoqTafUpBS0ih8Kgxok0yYBjOYvzezLYrILMW4CibggOP6U4upSrTtwRUveGbaoXkalzm9S0nrHtJJHqG4czjTHs1FDxh6ft7Du2SBHNuHq9pEDBoLD+VbOfeAsPHbk1o1DLwwypKs14gYgouZ8h9Xh3xr8w9zO0gS3UYi8unPx9mwBJuYYYHPaoaI3KZc2JK9w00OzLFY0lJNs/3+dr4gDy7+uZw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&49XlYrbrIGPDkf1APylPYTYug9YUDDtfdvWvIJ1R5THAA1+o+zTxhK72YLXs25EE7dmzePtRqb3l9lcUXtmzjskp8NCxF6/N420o6/mg1tsCtXzTeQB/tMXjnmSst4yG</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuicNFVe9koRAxTxKD2ZFjMlOLjJHB+L7190FftS88gHZ</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qeIDfi0+DG+TJyOgXyDhEa1</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLCdVCqHgwyWrNley/qJBXGauScheFDiuVJ/LF1EWD5k</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&49XlYrbrIGPDkf1APylPYTYug9YUDDtfdvWvIJ1R5THAA1+o+zTxhK72YLXs25EEKLGVX4uLcbCHh2DYSoUnE+uCQ67dowbat4tHG8WdlD5aYFMQ7DWU2ArcTP6wSE4z</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuicNFVe9koRAxTxKD2ZFjMlOLjJHB+L7190FftS88gHZ</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+BB41MSVe+rUPJdBeNztwPnBCd2XcFQ/1h+EcGvs1Q9CMCH3YnLQUTcKwYBwSSC4lOq7AIMcGLRNJWj5uokMAipZv0SHm+4xdXWFgiShntL6qce3UtjOcgN5Z5+M9nYzaFzWNt0L4KiudLCIKzRGHsHoCIjp1iexT/xeUHogDgOxndC7nSiLFIK4NAP6zyUBg==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjICvZJit0t/ymCLi8T5SD6HdYWC65ijDyGNsrFws6gEP20mJVjtQHq/+P1EZcDj+qeXVnaRDx/41h0H+SiQuvgojiPpFkbkMpGS+OTq2oRNBgMaE77+o7oh3bt2USMa2ZuNFcnd2ULXGqeZ1Oe5S5t1TjhXNiiTA7kZcrXGP0SZUvl0AnwPDOuKdyfCgpfxfVcDZ4xFjUmDcu8ljx2co3T7PeydjPetUWr0vt/AFbSjbG/1J6J4gffPPPDMizgwCMGCc15YjydUlosaJ+pxzVfziQKh15EaQyKgJ6kK6cEmP9s+5XeX6marUdOxtdmOkIJV5Ml9qFhcn/NLM3syDKJhjm44Dwl4nI4nkg/Ed0o3sboZibBAZyrj7VBkfc0l1dorlfmS3cc3MW9xq+1LUwLPNFJeJAPki9kCJAnImiDluZz5na83BanvJgCRMCy0yzq0Q2YhFbmlULDZ+0xdrX5e+vwNh6WBxgXhu4Q0lVgaQjoyM8dftSjOAMZY8FmntrlUvyvhAKd8qpfbk/FEaE5FnwCeZtjnSrtsrtbZ3UfaDPYpk9Tb+yimrp5YZ4va9dw=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+Opnx4Zd0wMDjKBfQUvXLa0QfsNh0OaS6VwqB5RH8cGjr1GJBb2HVb/KKENI+9GAIxl5nmMUsJnHfGU4Ko85HZXNOm1Nn1h10a7CUU2mYq0jl5u/8pfo3y6Xrpnl0IlNdZJLtVj5S77wbvAQJNwgqL3eeyQEXr0r2RpvRQGaHeP+syaV0rvvSGQb/dZo+NRgq/e9WcMH0Op0mDKr8QDmyAhKCXGPGDA5gcKI/syXBlp+zklM3tSVRNOa81Phmour0laObC9nLzc9Sab7QFtgINdsSQG9rnSX7x2IlWjrpxfl6uvlf0ePOapfCk9m+Qsw4O0QLUzkdrvhDEExkybU8uYVoOMlgqefBydSK5GlOdOZnyx5lAK7zj5NGOx11+7BZjpOC4whmDCiAEpo1q5PZM=</Encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1JZagSFsOgboRAIKk6DAKhBwAkfPbfRa8uI62l4Vto1cImcqrcE25ItPdhwS72o7DiFvUYwaLxEQDMIZ0Ltgq+gGKk9VV9ycNYM5C+AmGlJTX7k90rUVY89ky0Cs5QI3Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLtmSIDVjKtqYNLTzCqJDdvtrT1WHGmJ+WwKFicX3YadaKlAb5v6q8Fo1rAb8MjP3nNBPVjd3tIk68yzv0OIFEGN4Shxaz+TvdyjJAqjKVzAJ3T9e5nhADvARdYFP5IyypZdR/z+k5iu4V7uJOvw6Aertkg+KLdXfCy65M5AoM5Jz6B0fbAxihg1ayEBL8Gdj24eQcbhMQmQcIfiSTRFaUnhMjtl+m2KevoSnVcN3e4f//CbwYAMKn4tn2eHWKsvEVMIoV2ZIHeRLUZNCsZg8j6xD/CapQBkdJATb4HISshrjbX3IU3UmliMCf764GInJ66uS0Fuxm8/t1jRM3XxVUy9jEZcYTW7ddMv1WFS1y8hJG3xH90F8xQGZm+3DOu44M</Encrypted>]]>&Check;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDTsOAmwuSHXau7vPsNN7aXSMR/+ib4f2YAyC4dHRpykRqRt1ROyisTFvipss2YvLO2OXARjCZHE2nPCN9voO6SPV9sOtnS7lemjgCDLVv1VCR8Dv1ZP5JwThG8888VaMpcmZUlzhokKs5JGIJlUdfBrHd8Jdx5+Yx9431LMuBuMR4M8Q2VE1K1lZtbUBUWP8gmgFpaNygQsTyDpGj8+4HE=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5zDcSOzBeaHJNloUE1+hqfR3XzNtASSk9PtpYM3UVz0vRpZ0P+3mgia5C7jMPFQPsr7wLnd8zjwltPTlU0zucx2EIwNx9XFRFnfM4FRmc2azih1GpC60HRwOkiy5OH83TN2cC2s75mQsrUQkxT9vHd/Y7cc8NnW/D4arQYRV+sNpB/bYR4/nQ8QcYobQqKAjLON6/SOlqlFG4PgdWs6B32je0LJC7J6+q3CcGNAc+A2ELxgYeShhs+m1Kfd3/t7H3c=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkKtYmZzCPK+FflvoHaLA4DCu75jheGYOS+f32+iitrulCR55lii4+IwNM/549kLpiaaWTTP4dpmzyGbM3x8J/W6iiotORAttatfcyGUEAmw+gSTQFtdtKFnQiHF3cc2eMjhAjZ0D2o70oTonZGZV7XVcI3+mNWw3PztkDRtOsT3A==</Encrypted>]]>
      </text>
    </command>

    <command event ="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EZkaHvBTVddhIF50FXP5ogZ2Xzzn48wN04jGbZRRViznA9v0WF7hMJ/tF8kuPJfs9U4/yun/iHynrInkefHVCojJq4nhimY3YluMhuHdYWQeDgU7cVupJ99R/7Ub9Re0znUzDP+4LwfHnhAEJCH9Sz0tHhYIvuHI+EkZm8WfbtumLnAETqtzcvf9+FNAtMwBizZI5l0lHZcmPi5LE3dBM38dfZKj2k0jOHsepF7fh4ByW8FX7BXWppDO2RNhIFQzwVFpuWjcTDnrETqTRwdCMGcf1Fmo2q8jd2NMMToT0twC/XD/5DopV9AuXDOmN6JWY3RdsUx0fN3qcMcNC9zTpx0lgf+gayLthD7hGMyhsjtOBD5j2qJzdndz7P40JoSGS2xpEoPV4wyglXXu2bRjuKxCHKg8tF380Cm+PD1DKtOddKq0SDOScmjIWNINMdXLyFfiToAxNCbmpTPIav5kZy5+uIDqrdigKaZAkG+vi54j1eyrC5LrxPagzriPJNuPhi+Hk2FUZpMsLIycNV+3iuV+Rn+1Q6n7S+9ecKBt8JSf7vwibQsI7929PU3Zc/YfSnFk/SY4ZaSY1fYm+x7CiroDwVEX+HzVjzQb5Y1Ja5cWn8Pu3Kud252C6DSukBcmi5TTPR1zSCRPyaIKRYnOOITsLOIGp4YnrghWECv6kmBXlszbcHEVEFjrDYezJoGuu1+r57sisj1D1ybUeM+gokDUGxG0nqrwPHemYRCL1+V4EOMiTHd57d7XyN57LS8ARpiiLO1lk7SyLf/U9wYasfIKWCkv3qKZ1wNc6HFWjguddBGvRB0GYsXwtgAIPXfw//nVXHp+iQWpvROBws6M6dGyPoP4KMROUGqHfchcaG4iEcPmQeexI7vlfRn17EXb3TAdPIHw4luhZ46oxqdgzE1Zc8+V49uE2flF6k6qqXWX</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VbYGAhwaJV2zV4US7c/nl03UCBlMbCeXjFNc5UFMLw0</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrVdJ5hKhgjliXJ+tzHP3Kd5rYlwC+ep5z0DHiyprLdXsBdyLwz3quUzznpo9LB0ZhQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjibwzRob0wmBxy6J1R391KXNkfu/2i4PZc6QHsyJw+0qCs+W4vOEnlA2t/dtNPwFBVr/VPszihJBJlf/vVL5o6P</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFydQyDJEWQcT9b3p7KM5oA/ChITouhu/XQbbgG07sj99NhLmXfQbVs8PWdgcVSRdS2EkyKl1G0zyVFJOobu2Aoxc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrfS4LtvVCVief6ROweeR/Yw8mcDWLjxpvsVjvzF+VopCqx+8rtytm+IcYiwmj2rbVQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrSJeBbk3qX5ZRcloDuBsk8/ccnX7DvZRAz0KnQgAFH8QkUX4VnqKt4Hqteo3D9FSzLh3mqqruaOkV6v4IphmaHkwQmPOBgIJnGlYdL0sLSX9</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFySG6TtBGaksaEw8ylGxrgDRbDZFAzIA3X1qjoEbHr31fGZSHCQ637vQGPSShFUXkuS1KVT8DXBtkEwPIijizSLVV8rgZeBDkRpXF4xAl/dG0</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHemLmDblVZZyuvFaGPTzKq9rtoyjKjiunkbhD8N9+ARrTfxoTPdIUj+jzK83MnpDiqwr88FzuGaiVfuZx3tIPBw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrXyhVNjpQFG/vPIhtHlYBqmYV0Rk3UXRsUhDPfcOnSN3drN1QAN7mMMR8w1AQMm2QlcX8s/OaJatXjFHP+5/t958FKX7I4ST5ThaDPYUrNGA55926UPIelQD7JKqCqBh3xI57vGy19Q1peBJk7FQo5c=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99HS1Qv0eP8NdyIUbO1I6wkydyR8XStyMnqOjVK+LvzAqiPdge+2gteJgnKePIWc8FpDb6LIl7+oVKE3U6TyK+QVQ+Tqeod7akNzdtZs7GvS3oJWhhgxvGOyK+/ILSscHJRZlOsPG0KCrRCmPhCAW24bfXkJfapYMBpOlymOEMACw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjE6ET5pwU1lPXoM29kTvRO0vmNxw+M7CujZtN7eOU9teiJz19bRTZtMS5Ht4lKVI2B5EJknMo8vdJ2U2SmzcjtI74Nt0nSK94I5EcSawBPErn1Qy7A1Jj70LSdqhzsmUh+TlI3oQyPbYRRcoPP/dZj3LXz2MEbRfFjL70Q4gT/qa</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uPk3THcgU1TSBZoeIguG2ytMTtWodUg5ejOVLd/mLqkWFUxHQ3CEDhbDhwxk/nv5rw9Yt381RTbfHMgs43rNovO++K0M1pz1+/HopUinyrxsQnLask7777VZRnfNqpr94idA/U7rP+sR1lnO9AZjCFW9Vz3fg+8WY9ZzOCcA/JkW6wggHW2T/uiuvpsPGuYUYSsCyEFBganPsftCv4gBo2ZSvti6QHWlXfFQ95SPvZ8=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&49XlYrbrIGPDkf1APylPYTYug9YUDDtfdvWvIJ1R5TH/am2mvcxO/AX1oVpyLryCeFLWfIzcACpGlkNz1bqya8/m2Hbw27Xcup7e9NH/LQE8WkgqYjPF6W/o4aD69vGSZqszTD0ofmhSBi6nk3iiex7N044b5TyMF1U/GFFwSlJMc8sfIYAZ3NRoNLDR/jy6FSrL8MSYk932Pwc6HxpC/Q==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrahyPsiFLFrUKIS18bHK5bAYJZe1zNEqDLWBDj8MMiWw22Bp3LydZhqrlde81Odm+iXr5U0r3B/rfvNprfkmgZSB9j0sx5/BdYwWGJTsDWLmLWroyYuVQBeAeR5MAXJ+y1Rfzg5Jn08XF5eNbY6ikG7NwXVoRNNKEoIQAJAgLuHfUUVzMMScCMSHW6E3qfOvaUad8fqFu81swogl/fJoCtqpdsh4hz0I93OpgRO7yOgbpJ9UWe8vLiqDB5frzjAzi81zf1OuSTGjQxL9HYyn4H3YVXGxjW/gdmuJsw5OfCquTpynEBoVRHfH2jE3ZF3anTzQGO5KA5AFHSAoovcsaooadI7ZrXQ/JCA0ghOiVTshskGH3doN1HBKn4D4nfjHueD5eiMAyOLsLiOjAAIKauw/U3xEjjXUgkc1suPwBa7KMl01C9k4RegWIglJNocV3KoRs1xKMkalGsj/1V/YuviNfnlKrBm+O18bEmB+oSd0yMPEsUton8AMamqgbT/mURT5psivmFtSQ0QTRLS4jno=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EfM02y/fKZgN8uN7SwYdIZGbu6vNipbVi5nQ67snayN3NxiUF1MqU/icyX3WYg3J/gvWwxhCnrVWe7LzqYjLUV4WdskX0E66/yRNsr2UQd073goAv0MolVasCw7V7/13S+RhqYSp9G/jlcE9rPy08gI58Hu0U2mZ9+91MtI9Gv2PjYolL+dXlwZu7DUCDZecGjOQ9kh/3qf9A6qo0zArmGtCOjjImLIWZBNMgHpNAxIUCG0ENotpBosmFevoSf6FIoQLQb040So9+JyOIuYi3C6qaAqL5n2aaHhGCp0sj/jJgcOubhsvwMjtsnhOOTTKHYWZKMt49Akvnp3Qkl3qpXYNC0CsxDlD9ur15DKYxuOljzlAB2YlUBqC/YICYNDYLACCPu8H/l68dCsn7Obi6ElVV4EYqu7QvUq0i8eNFnlTBnBlnU5lUotNPxAadZWlUKB/pDcvRPbSNB8CNi+v6j1lf9q+QgzZWeCsOvzzRt8Z80iLBBPEER0fLWDudA1D</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzxgX4jLMXCAe9HW37raDZDq4CjBlYaRNRjZ7LuRuXFun8ELi2+Kh4l/pRgPM82JY1azoW1pKV55w2zdcHqKrROAESkGFRC1PdIl4enZMDHvoofF5H2qbhKJabyW2ooRIoNlNQpCIgq1Lgh3vQ0FPBbLuBfu0+K2wvtvNvbozFrI85nWD4g4H3lR2hFlLcxl9NbP2XxdRfOMV9yieOTHihyz2NjwQgUM/laqe+KLhdyHlUFHiKDZiePsJAdiouEYI4JHOfeLN7Vk7TwbK0YoYfE=</Encrypted>]]>
    </text>
  </css>
</dir>