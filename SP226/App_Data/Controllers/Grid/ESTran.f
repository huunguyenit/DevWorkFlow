<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % EIOptions SYSTEM "..\Include\EIOptions.ent">
  %EIOptions;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY % EINote SYSTEM "..\Include\EINote.ent">
  %EINote;
]>

<grid type="Report" code="ma_dvcs, ma_ct, ngay_ct, so_ct, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phát hành phiếu xuất" e="E-Invoice Registration"></title>
  <subTitle v="Đơn vị %u1 - %u2, ngày chứng từ từ %d1 đến %d2, chứng từ %s1 - %s2..." e="Unit %u1 - %u2, Voucher Date from %d1 to %d2, Voucher %s1 - %s2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" readOnly="true" dataFormatString="@datetimeFormat" allowFilter="&GridListAllowFilter.Column;">
      <header v="Ngày ct" e="Invoice Date"></header>
    </field>
    <field name="so_ct" width="80" readOnly="true" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridListAllowFilter.Column;">
      <header v="Số ct" e="Invoice Number"></header>
    </field>
    <field name="ma_kh" width="100" readOnly="true" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" readOnly="true" allowFilter="&GridListAllowFilter.Column;">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="ma_kho" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã kho xuất" e="Source Site"></header>
    </field>
    <field name="ma_khon" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã kho nhập" e="Destination Site"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80" readOnly="true" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã nt" e="Currency"></header>
    </field>

    <field name="ma_dvcs" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec1" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="chuoi_ngay" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="ma_kho"/>
      <field name="ma_khon"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="stt_rec"/>
      <field name="stt_rec1"/>
      <field name="ma_ct"/>
      <field name="chuoi_ngay"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+2dksMt9j7wwNqHRccL6gW51ChQF3V9ER5ZiqYbdt/Focqv3AVGHOsbjkfD4ZE76of5H+1LqzhTYeMKnCq6lXtwipdkD503Je20w/H3onLj3w6XQr3gjGkOW40BMUUMh2fzae5U9T6wo5iRjdlVFt4ZcjKcallhuxiimaAdZnIaWJFH0DrIfymTM6kXNzsvR2vgVGDG1wE6rc5CqXaY0trvLIP3njLzIxSiDWzoPQ6uCeI1LtW3U/AC30LMstxAQC+UEOflmyeanHfxpx7Ju8OSWplSVpHLyUENmIVZP1JhCeu+lfmvtbPGyMc5NI8003f2bkriOszL3EcAnIIu3SM6LiYXN8Z9OsSJqNJN5nm/Vqh9SXUa2NPTg/efXrQuVyYne2yQF/xx1FxViL7Ry1sBaHQbDBw4PtRMzlQTVc5LHhqmpPKt1g8uF9tGFaTRZNLMu+eJYtCxvekkVGqh2wZlSdh649aMYRmUkylxyvu0/hE7YXeongcG5XLJr8PehNywXTWZq8lgmp8dyrY5c0I/zD7oJzBujxzXFFNqXy9H0</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8h3tT+3qw3HwDrw8v9yB6FvcuzdSR9Q5G7mwrshy1v9YVNj++5xekz36uWCKUGBg6QShbn1VwcdyieNzMEpBHb5</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>&DetailTaxFlag;&EICustomerAuthentication;&EINoteFlag;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6KNEYAY7GL0u9tgNIwmqJkKSZxlUNTf+mytBO3HiXQoDui8CSyAi5dI4vX4HKJEzpPoLnGB5TnXS4XQwR+ITge23pG3F2Wfx990F5ZnfOBM2ldAz0lMc4S+0A6u9S1s1+F4d4OEUj8yt/sjnYgDoptljBab4QrDeZZXQZFqvwY46y67wq+VMiYuBDS9UsNRwzB7wkfi4bi683MNSvt3jt5epYKvV9/i31U4sLQrR+Iyi19usejFDetAKczZpO41X/A/z96Hao5EESz+bvpIFJn6hbsNslb89nGeJZtlhFfWq4KUyLf6yyYfpw3njo1qFUpC3QU04ekWY/hRG8DiIGruZR3SpeUrgs0bG2zl/585tTx0/yncpPrsSJaNu2ZqRvsBy+ThG6815e5rjwyEsIIuCR1GIAM+AhOYaepa03vYTIG5NROSyV4VhHYkoPtS7X5ztEuM85auTh2rQ/tAlVbVIEUhBP2KqGEP264b7eGubMZy6ootmpkUswrFUs0yj1+n5ljmOMQ5g1x7imizdsl/iZZL4kmtHiQtWOTSfrzae7xn9IqjmAeHIXka5iPAsN2bEPbcwqNjLXfQy24nDmIMk3iay1sNBYDLkipBRNV6yLpwCz7HWHKsNxJ49F1eAk8XS3kejIT0KFjMaVErsW8oW9cPi1A7ZH7AFi8rIrmo1E/W+qhjIQ1MmPJAwpMolMzI8Yc2j2s2JTUsDj25dIGmxd/Ke92+Xp4lEzjZ5aqRguDjzinqHwOn/WyL3sM8cZHtvFnwTQawgWNceWe8PKD3vWoYodZg4gcUJqV9ep2II</Encrypted>]]>&DetailTaxFlag;&EICustomerAuthentication;&EINoteFlag;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR71rvoGo4dfztrHIxMlTOh4q9ElS/u0UPmsvGV6UbypYufNPuy8WpuoaDhnRM7QDyqjwMUexg1pbYS0vNEFpv+1TMK0mku2Bl/u1MO2eTn5fXkmTz7jT+izqC1UlMO6AfMtJO86clVivmtAyR2DzUMjjxo4NH4YYmBWCEEjWcf2XMOrrHGZp/+CeQRfml0TzHnwi75f9/6ajQA7e5u8y9F+j4kC7Fdxo3IgLmb55JJXz14pt+KuZbqww9+BNfnBY6YX8vD4vQlIyWRICppK/B0ky85UfJaoeVM1vDyhJQLPBKBfU47SFVFKr7to7HHOtp3PsC+Ls7j35xLhMRdsKam0MqAsaVNV4GHLtI7k9YK+fNbO0OhipTFmHji8tXbZgand+yRi74grQKTp0WjoetTl73tsJEMfOdEuXyBf6rW1D5c5zfmq8bmR97poFRZ2xCCDhwH44Qkv0J74n7eWHdrSaJRKiok31CJKYcdpqlechLf2uEOKhu9Wg/sEj17BAFfFah4ZYQHgGdp/qxaFuKwOGRR9hmPyT72oQOcOzf9yyxrcSRbyyiCgc9zREsC7kVPy+cBP9afj9OSR9j30b4oSM3cLCF/jT5cBdY8TxMpUeQHHkpWFESeOgOiyaonK4TEwaS9ia3kMjErMEnik4rm4I3ERjCIsYsxB+7Zx1U/FHNu55Xx+PSHpM/kgVz1ihWZBwaujBVsSvTEb8xQy8uoOgZNK5kuOXPM/qliUniJWMGg/wQCCmZY/OJnFPkGRmCQCXjJhsZ+YHlSRafuDe7r3f1E66FhXti9boF1C8z/yX8HwmZiwEZHDaim9my4/zQbumY7xcgE5P45HnuEHSEMgdGz2MbUiSUhuJcrz9mvOtJG6pk5Hb/U68mJ8D+6CL23R7OMFwS3apkapWFU+BAfCLmjgc0qBK2+6Ujq39RS2q/Y8LRckfIlXXRzwydPQcasknMNDGKniTKJPmVR1rGd8zR55xIW8tEVA2OD+U05zlL7/uPmx//Xjql9CPJRZAL0zgD6v2Xn0cbkVlpwJK5fg5IxEp4p7OORHZJEf4tkusGp8VQMsW9bqePYspIgPMF4QuXRT0vG4aqRRcX387ILd8MRcx9qITgEVKCQ8Nq0wYfC2typhmc2WeMtd5kpnULD122pe6YAa77EcSjCh8H8nHps/gNCyDIKr7I4y7fnf0/EwJf6rDyTSn6w5BQKBF6jyGS/n72gburcSzlRH21wB7j06rfpbD87RElUKKcafyky81azOCT6d5UXVXtFoopIKJb8NURi/aMKyvu/jVVaBCFljcCaTbNXcMTWKctlMzV3EUJ02Ddsy+cLaZ8tYLkI6h1DY0dXJ+JCizq341mhWE/Hd7ZTXGQYA1u/ot4G8GE/NTOw4tT1m4ygnYzio8HwSX4JTAKjtCvFlYBBO0QYzcDRsHdWNFzR3rhqlGKqDhEvsnxldgxeE68kWBtgc2hMuRJxwrdS7g9YFtyDMSulxVaVTzMdNld38P6gnmYQKqHSakQ211ggc1Eek1geaFROKNMNTOXxMSzucD+HSjOPd2t+OFpsk7bY0i46pCIfjW02RuChCOJgd4pG9WT6EvC1dsFfxsH5IxfhUIDK14avHzNsgTyumWggw8pWypl9pDYo1Liqi2vj3lWpoBuMexv2NawfKrkF54ERTIk0wZxnb8hesIRKng3tE0wrtFD68/509Pw+Xppyj/EAbNWswe17F2nPtD3VwdDWzUGCs4Lk18FsuYZvwp+NDmQ1tzwNEyqD3Qw2yOV6drIkdpMLKfuMiipb2Dbkq0LbnveNC2XNX7I6qVPrOxVViOb/BozslH0Ag06H+xk89eQSDsdifceJZcwdxFtGqSBZ/199nsYcH7HL7LDTrmfZ5s9TyZ3/+ZDXX3o5JPJjN2u4pN0wEd60fmIJpvvBmuPIGcrFHyX9TtopgkfoO1x50YCJwD1Sqnf0gYmYBKiWLgaEK9h0GxR2fW+nowfhLKJ5bZ9knwOEm5f9S/KrcFRKzrq8YcdJIR/IzrkaIhfZJoKN72uQz+or+TtJFLxiuC9+yUg9hKHPIQOsAMGVoNnvUmfGV/fvRbrp+gD/s5yD7J4n3SEvS+aDNPsjtd8mxi8pKR4vXT6FF4+A2mRHF40ZDmrsEss8E3/b7z88zrYzX94HrSvMp8TO+OF+uLEGA/dB6NBMeWAJZ8dwkJUN5X61aLzXHP/NHCmk+iyVp06oat4++3Cn08uPlonb8j4/6ggbFJ4R9FXMeEK1TeSCRFIZen06wf1uft4bFt26xdM8R+vVBzYlTGWrP+sHR/knHx1Y1wZEchNMQX26WQn5VMi3LN2Z7Fp/TK4ki1rX910VMiUShrjeS5foaCo2+Q1hAAJz23RY/8KzP53B9nLGkkFFqKvhQD7q8SEOfkBzE/5YNJlpqyz+Fskf6ieETuR6QoDesFdYR5dBz5r8pMwKicSJ/WaDqtQ8WK7Htn7MgFSApKrSQnQ39yQ2i+dBPgOeAh3BXtv7qOIsmj+6LdTJuemVhtuxvHmAaEjtwOY9pXcphmKkV2S3jc/ufupcdEDC5zzc4GkAkYPmEy8GsQTSPKA0vBNMeD1+rJz/8O7uyu0RiL8jZe5Det8VTSANkIzLyHaB87snIr5NC1C9w5ePRnQPeMSifwQAioQETeWh8E2fD0FwvPXkDvvat7GYjLGwpTiwajmKCVbGZaCmECmVJBz6T1/G1pG1z14u7oyBXkKhC7gbJABL7TZ+XVUTVi6m3kJ9H2t3OMAKqXbuMBdeVQWTP9joRdEGnik9FOzySrED9E3Yo00nDqmENynfi/75zseAg5pPQW4V11ATD8X+zgWBvlbSmKCp82erAn3qDvRhn0jRgYYpwCz/LOSfecR9fWxQ4IbJYzk9uscaeg1kw92hzxEY/iTXwfdcBQ4dpJGqwuG8Cf/FHKpT36XjjZYUVxm1oGDf2R7bnYtjkMvSoQdEnDzYLttfyMXOH4RDwuh1/nrzE/OcHqBixTG107NIwsUmpOq36LTkZeBfDFP4utiRfWOeEKp15Atpy5GLyvBGY/yWx/hCgcGUkgab5wM1nCfjKttTxd5/Jr7lYlmu4phM7kXXTXVk/y69DIQLtIlGWyAzFStUHuWWg96XmYd30EmGLsHolBgsH8VlrS6unVigEuA7sdHiVrjOsmsbV0ilv7sftK4fi73qA==</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1ItxitPhcFkKiMQ0BcX1CNWp7Y2JAEAhqFmCTyhC7lnOW8lVBE8O9fDtFl8rUevaWtC5iKlg4URvxASg4C8iWj2aZoTwieIy97rvJRpYHEcRHGsBFqiXKITE7PFMGZ8DSaM1Xb88RQsHMCKr6KpcmnTwpWZoyBbiwqS4MfEajvcmFA+Sv72Y6sTyTh96Glh7CPnVel6fGhAa6MineUzfR773Fh9aDM8FXvnfOXmqYnD7DGRPfpnEVkSKH3vdbXcLg==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Release">
      <title v="Phát hành phiếu xuất$$90" e="Release$"></title>
    </button>
    <button command="Cancel">
      <title v="Hủy chứng từ$" e="Cancel$"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>