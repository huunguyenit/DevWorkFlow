<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenVoucherBeforeEdit "
  if @@action = 'Edit' begin
    declare @$checkVoucherUnit varchar(32)
    select @$checkVoucherUnit = ma_dvcs from hrrmkqktr where stt_rec = @stt_rec
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
    select @$checkVoucherUnit = ma_dvcs from hrrmkqktr where stt_rec = @stt_rec
    if @@admin &lt;&gt; 1 begin
        if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_del = 1) begin
          select '' as script, '$NotAuthorized' as message
          return
        end
      end
  ">
  <!ENTITY AfterVoucherUpdate "exec hs_RMResultInput$AfterUpdate @ma_hs, @@action, @@userID">
]>

<dir table="hrrmkqktr" code="stt_rec" order="stt_rec" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="cập nhật kết quả kiểm tra" e="Test Result Input"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" allowNulls="false">
      <header v="" e=""></header>
    </field>

    <field name="ma_dot" allowNulls="false" clientDefault="Default" inactivate="true" readOnly="true" hidden="true">
      <header v="Mã đợt" e="Period Code"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot" key="status = '1'" check="1 = 1" information="ma_dot$hrrmdot.ten_dot%l"/>
    </field>
    <field name="ten_dot" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hs" allowNulls="false">
      <header v="Mã ứng viên" e="Applicant ID"></header>
      <items style="AutoComplete" controller="hrRMApplicantProfileInput" reference="ho_va_ten" key="ma_dot = '{$%c[ma_dot]}'" check="ma_dot = '{$%c[ma_dot]}'" information="ma_hs$vhrrmhs.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZRuWg9WQJb6uq4PBRD2Xn/TD9Ttsi5/hxDwNHJ2lMG7l19cer/RWWEGKI+rV6DEu+ZYYsfZGGYU4a9LIkIGqyvQ=</encrypted>]]></clientScript>
    </field>
    <field name="ho_va_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vong" allowNulls="false">
      <header v="Vòng thi tuyển" e="Recruitment Round"></header>
      <items style="AutoComplete" controller="hrRMRoundExamination" reference="ten_vong%l" key="(ma_vong in (select a.ma_vong from hrrmhtttct a join hrrmdotct b on a.ma_ht = b.ma_ht join hrrmhs c on b.ma_vtr = c.ma_vtr and b.ma_bp = c.ma_bp where b.ma_dot = c.ma_dot and ma_hs = '{$%c[ma_hs]}' group by a.ma_vong) or '{$%c[ma_ht]}' = '') and status = '1'" check="ma_vong in (select a.ma_vong from hrrmhtttct a join hrrmdotct b on a.ma_ht = b.ma_ht join hrrmhs c on b.ma_vtr = c.ma_vtr and b.ma_bp = c.ma_bp where b.ma_dot = c.ma_dot and ma_hs = '{$%c[ma_hs]}' group by a.ma_vong) or '{$%c[ma_ht]}' = ''" information="ma_vong$hrdmvongtd.ten_vong%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZaa2ZdI+SsirczqvBrJFImGbxCWurmaOvuU2d5wd8Tkt3fDBo/54JJ5846bQmGzC4g==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vong%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="noi_dung" allowNulls="false">
      <header v="Nội dung" e="Content"></header>
    </field>
    <field name="ngay_ktr" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày kiểm tra" e="Date"></header>
    </field>
    <field name="diem" type="Decimal" dataFormatString="@markInputFormat">
      <header v="Điểm" e ="Score"/>
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
      <items style="Grid" controller="hrRMTestResultInputDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
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
    <field name="ngay_ktr_old" readOnly="true" external="true" defaultValue="''" allowContain="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="" e=""></header>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="278" anchor="5" split="6">
      <item value="100, 100, 100, 137, 100, 8, 58, 50, 100, 0, 0, 0"/>
      <item value="11100-101111: [ma_hs].Label, [ma_hs], [ho_va_ten], [ngay_ktr].Label, [ngay_ktr], [ma_hs_old], [ma_dot], [ngay_ktr_old]"/>
      <item value="11100110111: [ma_vong].Label, [ma_vong], [ten_vong%l], [ma_ht], [diem].Label, [diem], [ma_vong_old], [ten_dot]"/>
      <item value="11000----11: [noi_dung].Label, [noi_dung], [stt_rec], [stt_vong]"/>
      <item value="11000----11: [ghi_chu].Label, [ghi_chu], [ma_dot_old], [cookie]"/>

      <item value="1: [d01]"/>

      <item value="111000000-: [ma_kq].Footer, [ma_kq], [ten_kq%l]"/>
      <item value="111000000-: [tt_hs].Label, [tt_hs], [ten_tt%l]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="100, 100, 100, 117, 120, 8, 100, 8, 100" anchor="3">
          <header v="" e=""/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOShRzo7LUGT2EHto3Rn/JGAnPLgBJzvpKz5mMPhBIUtuMPfGbLwxF+CPl52IzL9jfXcTlLBGszZveJeote8lApg==</encrypted>]]>
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4F/1cqOSrPh418viGS8G/rZ606RfL0nwcqUyCQJN+IUH06BrcKFaTft+KSdSfWZiQCsFFMPXOo2JzN0DAyZtBQ=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbpcOdjTyZahPuZgQNtU4o+N5Fbf4n57JUc7t0ZG5BrzRKXWpQCGB1uD8SAMxwZiR/7ZajB/yTMW6tlQj5OGDNg</encrypted>]]>
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6WFmMTtEe9CnzKv7pnFro+9lwzn0qdxHc0TNMuAoPyGYQcFpab7XMvvEsddBdNEGyPR6OpkgLJUG+8YkDqagKjYQgyxmOv9EzIQQm1FkXg3LOtt5QIClSXj14rNjFvLB5Mh9bdio/37yWRkVhjYZJuP63+2q/5/cnYXrEp8QIKyYIxYMgajOzXCunoNDbKmZU3b1nfr1WLtRNDM5UG5GOaE4UvbevS3bP2X99UgCduSt6NwMhiI0I8xa6pN1IkVmXJ+A++3bRTNVG6szzCBlyd2npjplFPajpplthmq8/tvDQGTocTf9RKD4EdP5KfdeO3oAv5rnmHbH6kZsrAyPuOoyVlp17fvSCR/oFBUqg02Q1eyvna5P+FQGlCl1M/iKQrKgY2i5am5jLC2dpHJSJ4RpdPabGO9cBlTgtThB4nCorbEJm5WcbGV28IxbWgdnrQnU7jdG3h59h/+z+qmrEwAysKqvwslr27PWLkXvX5ih1MaSaaqCyXKu3byHmgK863uC1mJzKFkbHTfgUtjOz6U=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliaaZ7lP5GMsQAn9UOKTX6jHzTmU8JexxrRj34NO4h2ufj4UV7P2O0j8ZOz87Xbb7r0ibaim0FlBZy96iH3Z3itfVOUTIdE/qSQOcvXd2FKP8ARzANI1vQYzqozDr/jQib6atnhXxGnPrl8tF7bIw1WI2s/awetwy9EZbn5JZz85drmXcAO1ioh2I5yTTei+o0rmIuX5sX429ZtTZL+RaaRMJC0kNWltkUoIdqjKO4BEZEAPDa4DtC1WLH9om6tVjDWvT9HMM5LMUzqnZqRMoXGcida4R6JMI6IwBtXFz6jfvAaDbk2OthQRoZ9EHRv6mKS7jB4BCMtxc1y5i4K3q2ul5F+ynMkqYrVbY9yntgGbJcARA+Vt4weyeenfkuq+GHQco94dmwldNQ7mdBD6d5SX8KCXJ3iVagGvao334snN7a0ANnWKqv5OOdj/dsgOKwSftBDFF3Q9Fdx9RVhYfKPvYY3UkErjGJU5O37ciLiaOQkFR1Xs6vOPgnd0Yq9L6SmhNlnWyNNP7lgqNjFEX7Iw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nW2bM2XsKGquqDRcTWex239TPVR4+cFGSp74F5TFokMapeUnoGuv3zjEu2LFiUUTdjqTuzDrGD5XJtF/jGIwvysP6bSidbaMeXtLyQS7RkTlO013B/Ng8pbexCMGdEmLB556XL2QgbD0mKm3rG2xItKiNEkqZNb8dteUfJTqXubA6bbXdhugA6t/NOU+E8i4kapnRlYZrCNLehBf+GcQ7uNqTyTCe932ahPAa99xWr5KF4hqzs244rpGkltO9HnUq7IXlqqZVg7INxuD0VWIAsdDswB10CBTH3zpNfyMcn+G8Lhx0tChUzR8j42V8M9h7k075KijoFZiYDT0R6XVcLef3jshPFpcxYlJ6wT3fB2e2z+nWYOphDWTChJ3FP5dGAmfYbKirNa9AnyIo5iRPS7ucooydu5yotdesqDG1JmLekxqRxT3SO3KxuE7j0VG35O0POSCix1W/ZuXP8nRfOC6rGnYP6EWRb5KYlVMV2o8lvyf28VEjNV3wyeofdKkqG3BtVc6151xY2FdiOhUXU/sgBKBlZp6hatVHgXKg1Lg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6WUUURComa61BVSzqI73DeeSkyIfF2UvGi9Q7qWrExBxuKoqK++0jbbHp/cSkRG1Tp5SFWA/EPDh2DA5JlFKpx7gmPkdZy57OTXdTdOli4gtq8mY2brX9dteFJnNo/RUsnA45SIetjjGQmsAuVrTKvTwRlItyWBVWzE37y9oRK9iDl39Idsz6wdmo1iVGSbH4g==</encrypted>]]>
        &AfterVoucherUpdate;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jM3ZcUah3+9RhVxl9zt0SQ8FSo0Y0N2ykedS7zQR1IhbgHYtAdFT6ZMkEc4LMNdjeqvixQIPykXCXLnOZnvBF21Av6eX4i5KoAAbQdltvOr+TR8lyOW/MRscSBjUBC4tMxfYOWyTkWC1EijUoniJydZwo9mk0C4RU4Xvcas2jpxxXv940lKhACEOijkr9fOzuX8v2/mnDvwiW3+6VGrnPHE2bp80G0q+gREBiW0nIDqiD7j0Tf+1t9DtHSyvf4E5jc4tUO7rozb/z/kbHIUdH6yiMRvrz3EVPqHDlW3Y/CgwJZf3HloHPtjftToPveHsZ73jePMh9erMmpqiUB2DN/AiCNH4u00NxMv6UM8WSL7/HyKakf7AY/jSeAkSgtBgX4GW/E3nnahc4Xsm2fBF5mXtkMnE2ZeM3mT28QqgP+X2PHFvIdv4vXmjVz9II+Ef97GpTshoRrFVGouf2Y1mBugwo08a0H9Zqko9EG07iUCkyWdQ4ObjqU9fa5R6qDMer</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxhSSgHrn0dvIpj2iR6+RIMlgCRWavx3hQH0zu8Ud7bl9thLb/HSj9l2sJPRY5AGxcHccuBi78oarjbRmi7EjBuC1EMXw3O9nlKB5qDqr8vlYDMZmHc39WGol0XMNNKKgub1rLZAje/UTaK8fbm7n+YZJTycK1YJIXjDt71z0ujSu8Hgye8/yp0jZUPLy6vPpg==</encrypted>]]>
        &AfterVoucherUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cHVNSGDxIl9Uhv2sJaVFWmKbU13syWZBt5nqs/lUOKX3r1gK1y2vsG1BU5WLAaRr/Crpoyl/1vwfbXYi0es/MpOooJYFI+9bIYzV3vZ3up5Lk/tbFVzpOEViA6j8vRXlw==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Np0sFOmsenpE70+PvVmSSq21bu+pga8shGQqvMKBWps3YWgzSSr/3jcD1ejAG01wDHi7i+qN/ycXXoNbIc2R3KfpGntGknShnrBPdXyFSusnIEEmj7+IaPLZUetRHbnpfxaHK/DZCVjHKruplA5IoZ1UgX/3U2WNT3voOh40Oke98nQxiqoF3sZE72FM+BOlWhuldAPPG/GRtV4Pj2GB1JoIlQLVyjc9ez5+Y2H7HhM9WRCxtDG70E4KXnJGhUtb4sug8J4kXjnF0j7PcyljxTYDCvtihXBWPp6+FZGP0jivZqZRrGXkgbpsl8uaieGWi+YcjmlG4KJ4Qg+SfjJrn3cEXDhpv6vKtoKsTeiviQEiWV/ydherrNiySUcjIvT6VQt0l+BJO1gVZs46IOEnOVEQYTV/WxBeiaOiA3pu/bWeAoW/gh7dSuc63Hi7+b1b95OvQMqUhZHamr+jAlwCjK8lPvvegt7nHP3rpOkKeHL7ThE7KmDnR10Qo67+9f1O2TglgjGRhjTdUf+sXI0N+O6O4Cw3fgWI9jA4tYvy4o1T33Yw7z+kPzh1V3q4ARleDKW8ZOno20bCVadwXpRWTzgqUBFFjphAZSoC46Fedsd0BmYOPeSHtOoWsVyS5gXMK0tYJOjd6/PyD7fSxHbHnPvaN0D3RqId560CVjbcTwEjlZOr3pPLWNej95LxqNepHF/S//5m75oarS4gRFfDx4pVkrK+1ISvXR4bbt+jJBlyJlm6jZlgd/n85QrBMzCxgE49LtDrz4v1p5GXlDlclhn0ScwAn4YtsIrCt8c8WBe8VrYA1jeO7QXixjGNU5Qpe3Rfpcqb0KgpgolUWLT1DYHYJfRkc8DLLoBN7roTjaCBDUwanSge5Dnj3B3Oz77zAg3njwQQzCnSPdeK5JjaqJXN1Ia9qD9kWvF8tGYiAkmePPBll+H+BJeOcOa0np4jOmXp1cfkYozr+D/6RBOthfdhGzr1xaMdYf5j14MY/+2QGzQK9bulSSvHij4vRCNU2AJEU9DHpsDGZhCpQDrJhaw2QgjpZ7vBI9RCUN4Fwqzrcqb6aKu2jnJNKevKtwzNJUBNWhVj9ZtDLIot+4rY6mKypYKpd/3VT/icpPcwBOayUJgaSFLqdfOs2EoQfgf7Y2BeTr5176oCNTUXBi5b4QUT21n702lgDWf/S9bjQA4Uq4qtm0PVrlb370+nJ+rqQ==</encrypted>]]>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6b8rsoLNoonZnzy+xDqfLkEzMgoGj4teY7Kz7T6XQ+z5QVuR8bCY7SCfjNlWzdIrsmeAA83EUh+bZ62OLIb4YTOaE3cJpN6XB/x4uZo5doYxL84qT2jzI+rzirhRTLPmmo77VqgHsNYAw3MlYsby5YwTD3iJPVbzIrVOYZfdkr0frOYzB5IUUmuQr/XCT1V+S2f43caTbkS0+e2seGDllth5RHzEmT+UlvGSdLXdTUL9FlENY28bJxk6fmfsr+pP7u+sHjUUa7QRgr094xk9MjZWtmAylgpc/e8mjqDLaNvVPin8jb+uiud8AhChJUcH5k1slNLioqIDvu5ZCTIv8+qc4IKidCUcBldXq4EGP82eUibVnwSQN5CuHBG9hsv0Jq03tGUpXOHS0JpCJB527UrAhp5b0FNyzDvitw6zmNck0dPuNINyfKxL8CNORnpPi+TkJDpXZWh8smU2W7mmcQYC2DEMMQfVstJCbbLQH+EC</encrypted>]]>
      </text>
    </action>

    <action id="AppFormStatus">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK65GIY0+1gnhoWj0nt0DgX/+aQ2HvDjfW9DduxuC7tKMTbMTAq/CNGcke88OD/2dcgfWjpt3ikiliFASzOvQFbS/AV/8yFLSK0qn6aCQ1uHRscgLLOF0zk/9haMXoZHmrrxssHM8O5YA6XMsC/F056h8VI/vBb7CM1F3HU3Ke/1vqqXMZOJGKvxo9wFJHTyxcliCaF8muXH2gRp0NWmZTgunvZs2Gw2XDY6V45XI+a1L4hRTkb8eDmnKuHvW3Rofo9NV2P0HEE5o4KA8zHe0L7N</encrypted>]]>
      </text>
    </action>
  </response>
</dir>