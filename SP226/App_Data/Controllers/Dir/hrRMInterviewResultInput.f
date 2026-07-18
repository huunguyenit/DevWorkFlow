<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenVoucherBeforeEdit "
  if @@action = 'Edit' begin
    declare @$checkVoucherUnit varchar(32)
    select @$checkVoucherUnit = ma_dvcs from hrrmkqpv where stt_rec = @stt_rec
    if @@admin &lt;&gt; 1 begin
        if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_edit = 1) begin
          select @message as script, '$NotAuthorized' as message
          return
        end
      end
  end
  ">
  <!ENTITY CommandWhenVoucherBeforeDelete "
    declare @$checkVoucherUnit varchar(32)
    select @$checkVoucherUnit = ma_dvcs from hrrmkqpv where stt_rec = @stt_rec
    if @@admin &lt;&gt; 1 begin
        if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_del = 1) begin
          select '' as script, '$NotAuthorized' as message
          return
        end
      end
  ">
  <!ENTITY AfterVoucherUpdate "exec hs_RMResultInput$AfterUpdate @ma_hs, @@action, @@userID">
]>

<dir table="hrrmkqpv" code="stt_rec" order="stt_rec" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="cập nhật kết quả phỏng vấn" e="Interview Result Input"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="ma_dot" allowNulls="false" clientDefault="Default" inactivate="true" readOnly="true" hidden="true">
      <header v="Mã đợt" e="Period Code"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot" key="status = '1'" check="1 = 1" information="ma_dot$hrrmdot.ten_dot%l" />
    </field>
    <field name="ten_dot" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hs" allowNulls="false">
      <header v="Mã ứng viên" e="Candidate ID"></header>
      <items style="AutoComplete" controller="hrRMApplicantProfileInput" reference="ho_va_ten" key="ma_dot = '{$%c[ma_dot]}'" check="ma_dot = '{$%c[ma_dot]}'" information="ma_hs$vhrrmhs.ten" />
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZRuWg9WQJb6uq4PBRD2Xn/TD9Ttsi5/hxDwNHJ2lMG7l19cer/RWWEGKI+rV6DEu+ZYYsfZGGYU4a9LIkIGqyvQ=</encrypted>]]></clientScript>
    </field>
    <field name="ho_va_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vong" allowNulls="false">
      <header v="Vòng thi tuyển" e="Recruitment Round"></header>
      <items style="AutoComplete" controller="hrRMRoundExamination" reference="ten_vong%l" key="(ma_vong in (select a.ma_vong from hrrmhtttct a join hrrmdotct b on a.ma_ht = b.ma_ht join hrrmhs c on b.ma_vtr = c.ma_vtr and b.ma_bp = c.ma_bp where b.ma_dot = c.ma_dot and ma_hs = '{$%c[ma_hs]}' group by a.ma_vong) or '{$%c[ma_ht]}' = '') and status = '1'" check="ma_vong in (select a.ma_vong from hrrmhtttct a join hrrmdotct b on a.ma_ht = b.ma_ht join hrrmhs c on b.ma_vtr = c.ma_vtr and b.ma_bp = c.ma_bp where b.ma_dot = c.ma_dot and ma_hs = '{$%c[ma_hs]}' group by a.ma_vong) or '{$%c[ma_ht]}' = ''" information="ma_vong$hrdmvongtd.ten_vong%l" />
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZaa2ZdI+SsirczqvBrJFImGbxCWurmaOvuU2d5wd8Tkt3fDBo/54JJ5846bQmGzC4g==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vong%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="noi_dung" allowNulls="false">
      <header v="Nội dung" e="Content"></header>
    </field>
    <field name="ngay_pv" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày phỏng vấn" e="Date of Interview"></header>
    </field>
    <field name="diem" type="Decimal" dataFormatString="@markInputFormat">
      <header v="Điểm" e="Score"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kq" allowNulls="false" clientDefault="1" categoryIndex="-1">
      <header v="Kết quả" e="Result"></header>
      <footer v="&lt;u&gt;K&lt;/u&gt;ết quả" e="&lt;u&gt;R&lt;/u&gt;esult"></footer>
      <items style="AutoComplete" controller="hrRMResult" reference="ten_kq%l" key="status = '1'" check="1 = 1" information="ma_kq$hrdmkq.ten_kq%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfTbaZpOwy60AboboWv8UYY463yKsuZsDCpl5qOEIyriRK9tpBiCQYLrJI4FMg5NIg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kq%l" readOnly="true" external="true" defaultValue="''" inactivate="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="tt_hs" allowNulls="false" categoryIndex="-1">
      <header v="Trạng thái hồ sơ" e="Status"></header>
      <items style="AutoComplete" controller="hrRMAppFormStatus" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$hrdmtths.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="d01" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label>
      <items style="Grid" controller="hrRMInterviewResultInputDetail" row="1">
        <item value="ForeignKey">
          <text v="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="ma_ht" external="true" defaultValue="''" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_vong" external="true" defaultValue="''" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dot_old" readOnly="true" external="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hs_old" readOnly="true" external="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vong_old" readOnly="true" external="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_pv_old" readOnly="true" external="true" defaultValue="''" allowContain="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="" e=""></header>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="278" anchor="5" split="6">
      <item value="100, 100, 100, 137, 100, 8, 58, 50, 100, 0, 0, 0" />
      <item value="11100-101111: [ma_hs].Label, [ma_hs], [ho_va_ten], [ngay_pv].Label, [ngay_pv], [ma_hs_old], [ma_dot], [ngay_pv_old]" />
      <item value="11100110111: [ma_vong].Label, [ma_vong], [ten_vong%l], [ma_ht], [diem].Label, [diem], [ma_vong_old], [ten_dot]" />
      <item value="11000----11: [noi_dung].Label, [noi_dung], [stt_rec], [stt_vong]" />
      <item value="11000----11: [ghi_chu].Label, [ghi_chu], [ma_dot_old], [cookie]" />

      <item value="1: [d01]" />

      <item value="111000000-: [ma_kq].Footer, [ma_kq], [ten_kq%l]" />
      <item value="111000000-: [tt_hs].Label, [tt_hs], [ten_tt%l]" />
      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail" />
        </category>
        <category index="-1" columns="100, 100, 100, 117, 120, 8, 100, 8, 100" anchor="3">
          <header v="" e="" />
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Xt2brgZOO7ZR1wWRmGEKlOKlquzVhwtaeXNJosLYYlxRwPHAOMhA7EvoKB4UNimnaTUdbdJhiP/74Rag7Clcfagx1GxdnfICa4cFBRvYc76Af6IpXigSI08xoz1qiSjkgYWJqXvikhMt6Wk2j2dS5AQAC+w47bWk7nQ2Q78J5uvuswOE//I3tuc/pstn6h+iVDTGhTwvdYr26URWpXq+mHlkATX5wDt9N0cA7bvWZNvOGrErbbIjwQSpAz4nuEUmh5ZMDU8N2XXHI9mYPaaSUY=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOShRzo7LUGT2EHto3Rn/JGOS68UZ8DghHMaO/P0K5XaTZqoxpr6a0N+/FT6uTDDlhOOi3GwlLoYh1okMaHZQbrg==</encrypted>]]>
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7/jFjhw36Yjy51jdiSJDy1v0xAx7+5oBEJDZ4SCdAP9JY8u2iW74soQE+wJAvPVtvRNN4M2XCtWsyRXW7uwWTQSTy1uhD7h8MOuNTT3SUN2</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tONcteqUa/ZOWJaRHzGmeww91TfJuVcNEGVB8dZFqPBdM+vkGrUq0zESMOcsX5Wx3pe3EkEdtjYZ5lIT/sUH+NNA==</encrypted>]]>
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6WFmMTtEe9CnzKv7pnFro+9lwzn0qdxHc0TNMuAoPyGYQcFpab7XMvvEsddBdNEGyPR6OpkgLJUG+8YkDqagKjYWbmzpwJ13E0fFQqIzIX62SgT1nD1YsjmTLUYNrfdZKk2cd7LzwVlGz2GiLBMagHIZYTO7QtHLBQ+jdrl8Ztz+b2VRS1NmUP61SEiwPAq+VatSBVaddQlqqNVyWiF1FoDGcMuVzdgx/rOSq40/UMCoqEcxF7qxmPy7SsmRMPvnCbUs0ZaLQKK47WLOoADScMYOLyVglCyat4brMdeMzXKEjMG8hO+9EzFKPUcAlrX97nXREthCcpdCG9n9Vxn+SfV7UZ3DGf3Lb3iBGzM1DPRO3FdesCLfXzFAbErJGYbr5TOv0sjk251KqKrJOa9i2dFr2GD/7cNzvBqxCpbgaaI94R7tPL3Le7nDpDsjiLdI9Cchvb3OMmHT07GFjzjnabYOh/QTX+/x0zvGNZso0XJTtgzf3la6iVg6V6GpRuBlF712ik2PMzKKk4hgZj5qb50=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliRKUn9m0F04UHlVU1a+QXIDA9OFaXf/yzTY3QczdN9x2CWv2Q5bTgJBk+AVu2Nx/V2R6YVYwnVEyLBQtjrofFda/YM0tlsyiTVKj9CVEgMTv0hONraHd3tn6Mq4tN2E7LK8Ct0ymtnxhDX3i2X7pokK6JK4Ox9gWnbLDndv3Sm6Vyo3Lk0tdGgfYiazs1U6EnnFkdcnXYBTgXH+t5BbKtXIolC02TJDCNTLR50ysQNvu0TVz/n77xk2fryUMjXBxoNUnd38BXvXOpcj6ixlwBUCLPhdPrVAAbxYUAIxga9kVQEElU5Bcdsd1A5+gOnKRdIeCcJ5uR/waL8mXauYCS6wCWhKGhSaX5SXqW10uhn6AZW3NBCC+8ui2uMcniDw9gKTZctxrZp8FRAMLJz3Chnhp+xevdlL3qCDpkJEKwaZo8DYUzKfAI0+wQAzyavE3QMvgE23vn9vI5s37TRuHajsApYxiL6q5z/AApMS2jia48pc1g49M2spDOnuICZGQFT9zZz7on/1IOohOjURbM8Q==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nW2bM2XsKGquqDRcTWex239TPVR4+cFGSp74F5TFokMa1EbLWo5CxZefxj+OqxIwyzux1BGFZvDVT4NQeSJd2dgQ90EFmWvahSsobQ71ETd+JbvF61RhKMwqxHaJKMpK5UniE4p/KJqeJlZIfiLub4NwWTl7geeaPal3Qnz76bF6YN6Hf56Va0OgzuinpCyxku3WuLSfiImuStSouJIxBmjduw+6Kxz7rGzFREz7ir7Cd3P0ux4Ue4gQESgo646KeaUzr6E9kG+QIrTGSAchO/XcBOZSH+UtVNr+OVk/k3Qf6mQrRDUYkoJwlbBDSx3eL0wNnr0NhJiWgIXewqGXZJToOtasWWW9INm90zCmG/pVKf5HZ5o96TbvuysMUQbEnEA/eIY/x9EfrQHio6NM75GTJqFDdNTVkTm9S0Fco4B8VaWp2Ojh8UuipNDVDRAUM4jrcCFubOgnvRQHd32rgsThMdFEyfGB3aLesSLl52fRwuSHt1l2zbz4UYGRFQF20vbz7a+Caia4ji6axBVJJxCt8v/KS3WbVpAR68Irhz+4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dX+AvVIqwXPyMCkSi6mlCXoY0bS2od67j6v5bRITlYaV+w5Dz+Kw+J4dDQ0NkG2CvwosoH8CBSWWNYm8o/pE/gMtLOVRhy33E6zo/sveFlxJ5gYMh89ZS5a2CHoUkxWAFEmgVDrURs8z+REM+ceK04CdScxc1VLrADqlXFHsMtG7nNnJmlKRpTwZO2NHEvKhQ==</encrypted>]]>
        &AfterVoucherUpdate;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jM3ZcUah3+9RhVxl9zt0SQ8FSo0Y0N2ykedS7zQR1IhZqqYSylw43kBLYUhwfcIyRBxXKsiZth2FWuydiyC+R0kFDFk8SUH6mlsPk3B38hX8Xm/i0LPiPKWlU0fB615RohrPysnpNGPZZo1QDaALQkM7uEmRyupl/dPD+OyTfYrw3tBoliy7Zn2U+NREyMrdTbiL+G2d2qmjQvp2+2N7vKxWaq/0V/ykQt28nwUZWyWH3HfR4zsq18vuJSwDzCtwqudhKCitiBLbby/w7cux//0y5wj/KOkGd1RYcVa+iKAxxthR0zcj2fG5gI6sLDzN2J2N8Y0sMIDa76Hw0sOpzHaaP+361BPbxC+XqfDP9A2+I5HGM5DSEl9NKWsHLMuXujUXYFMN1+HLC7aa5V95z5xsBYEUiM7I5uIyfrmGl17oPzAKIETrncqBwuQJKnSbLiWWfE/Mhu8JXwVo7SDMfRvOSQapN4HX/N1X8UNTaiUHHemw8c4MSabQHSXD9GUD3</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxhSSgHrn0dvIpj2iR6+RIMlgCRWavx3hQH0zu8Ud7blmYBTWOn1XGqNoxdIlIMvWod9s9f4hTFF/VBlEWCI7+vBCrjqhqOcqpp3YYemPupLJa6U+0T6MEWpgEwOFxr72Ee03ZwFK1YZ0DEBc8Brl8AXHogO0RiB4AgaebJ+8speBhUmfaJQmv7NzVshjZuClbSx+3l2HWokAwveCmYp5CbrAg/lUrjf9Zs463kXVhj4LOy1enOuLuYu6jzyqGnAUQ==</encrypted>]]>
        &AfterVoucherUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cHVNSGDxIl9Uhv2sJaVFWmKbU13syWZBt5nqs/lUOKXaw0SAuA2O4IGT5KaOLUoik4degArH1Palpeb5C9bmI57cnhEvvJ23EAQVF00brNZAjilkmBckahFb+KGV2Zzmg==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        &AfterVoucherUpdate;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Np0sFOmsenpE70+PvVmSSq21bu+pga8shGQqvMKBWps3YWgzSSr/3jcD1ejAG01wDHi7i+qN/ycXXoNbIc2R3KfpGntGknShnrBPdXyFSusnIEEmj7+IaPLZUetRHbnpds1ejSMnqIS3VOscW4d/vqVaWfRBpmCRf2niSJpWWpI9LJaVY0v8RbTGxPDAQgJxxT8EzbsSq30wc3IpiD8q+nsI4Lvw3WzwmkDYnrw3SJUqwwJPhMAcxcMdnoWgYevACCk6U2dUvqOC0pgtAsDkGsAIVZly92mgMcs1f7Zq1fe15FDVvcGBYxJIIUWbnl5g4DnancK7Mk3fgtF++ImYjlERnUXDlnOzb3kl+w3JZu+lSVJBfYX+p41VxqCpnLK95jLtfkL0bjklVwb0MwLzvB19Q+CYb2H9r60kvxBjTM/jbyJ0qKix/urG1kBoyZIgW08iBILBdvbVgYA8WNJ/aqaC6/uG/0UrXuy0EtKEISmupTLl8Z7v49onzS+8GDBaUX3/M8Ah8/l/Qo8m2dEQpCSrEaWl7Y+1e2ejQHTfKJ1quUiy8K34xxdlA+wWA8KHYcKg9Jt+qJjlEMD/YdTe9rQRgKjZ9XJbUd6UfmoN9fpvNTvZVvVD/fiHLoO17/W3DP9b5LrSY24ZrfBSgsRM3Gbo/vlJyvnHyFxhhfmdo6SPUM5yVGz5XiBT6F8j/1EwcEWfGTwONRkPa4iJcXXSbG3iDq85FzuHGjFe75PB7stPZ+5kj3aMeWYycawQgGKX3bwX+HUw7MQOMdy+4ZZsXSdeey6AdK7NXqj8nb7UQje+rqlNt0s3yQY438l63WPz6OSArdh5FXfPpXTY/c7rDq9lnmehKWaq3HciHhMDubWukAyWhlJgeYOxjagTbipyqXWky+ZQD5Y6xtBoiA4gdGHUCox4NWHwExirc4VZ+gc8JywFrngffqf1Z6ZB8DyKuoJFHRVnaxbzLadpwyP2NuPXkWVNfmwSLt0BDhDeAL5MKZJSifkzYb3N7uMKqFVXB3B+S13M54PQvuCsm9hRW7dyLvbZhBBHS/tfQo2QBhqBfIHGO15rO0b9puULHjdfbRRCkp2UA/92PvNw0CgyRBNP2rXvbL8+k9QbtAhjFFUujlxBV8W/xXDP6egZiPRW8+PJ8OBz6sEAjteNp8UXTMNTX3k6lX9pZ8rGm2LZArESnYM3oj7gQA+dRxD3UCM7A==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="RoundExamination">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5oz4TYmyCshkr0moc8SwTsv2yVude0rHDYGKNseNS+kjBW5HmUqlIhWiDxHNtQA4TfU34uUlZKL0Ixe4T9GCK7Ag6m8CRuQqC5xB0/r3hc8UclR6eVPmWeVcGZ9AqllV7ufbKVubcKfhCI+jeQ7FLznMBvJ9E7S9GYOo55a0yoTaFblJIXWMcEXPBz+g3EODFXLWMnA7MoSkHLJmhUAfsIE475ajJ4jJ8y9PACbL4eWw==</encrypted>]]>
      </text>
    </action>

    <action id="ApplicantProfileInput">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6b8rsoLNoonZnzy+xDqfLkEzMgoGj4teY7Kz7T6XQ+z5FNZaMAKSaHTMiy0BowjY+QVvneYN8dLw513xF5ZvDCRIxueDmfVkbGQjexvkRvPt36/s86uioDyPEcS8C3RRjD+vBcEc1pgv9+7BxVxVjMUQDeVMAy5+KVsLxq92jmffmFOrOIO85CUgliYLclC9bkubrJZIZKKoXzxoDV9F68fy6zQFA+as02x8WFOA1YrSppo72H+ru1pY+Vp1hOcS9RNDTf7vzxEReCdbBq1T1fbdrwCDZmop3X6DmqK4skAOfvUFjhTTwVSDosHNcnVqjV7vXKjdsWsrTujio8ftbqJmwnXM5xEgL200CJJsdr2/jrF9xEidohqBzgYIx0Su3b+yI2Ynkqi150bNeAVKxe01tB13izCsC8WEd/vLeDbrfhqq937RWiNUWi2d0wpRXa8HffaE/CeE39OwTxpnHcBVJLYWi5M3TgjaeMjjuRAr</encrypted>]]>
      </text>
    </action>

    <action id="AppFormStatus">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK65GIY0+1gnhoWj0nt0DgX/+aQ2HvDjfW9DduxuC7tKMTbMTAq/CNGcke88OD/2dcgfWjpt3ikiliFASzOvQFbS/AV/8yFLSK0qn6aCQ1uHRgxv5PK8X8Ibn/ohts2Txmhk3igIwtq51noVCu37Q99+BsS0BfD2dic+b63+2i93QDzWTYNPENPVKuYWL5imUvDbFOlQb7QECitilKPDBImJ4KCrMkSmGyS92E9oHCmONSx9nFEL+5c7NTgVjVJshYqmE5zVwrXifPvwTnSZKjwe</encrypted>]]>
      </text>
    </action>
  </response>
</dir>