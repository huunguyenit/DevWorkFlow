<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="dmpbky" code="stt_rec, ngay_tu" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Units"></header>
      <items style="Lookup" controller="Unit" key="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1))) and status = '1'" check="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)))"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="110: [ngay_hl].Label, [ngay_hl]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFFImPuRzzE9ngMvEpLXiol0C81VzmkgIePtIm9c1bDu6lF3PrP68lZZBpfxSdWV8A0d6bZ6DRneebaiAjkeaJtiwO4kec/pZMlwLcFVah8gZbEGpNvlbVZgI/RxL1DaUjK</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm48j81uXxMgtQtzjASpymQGxB0TTEI6z1uGg3YTAxbLZULURm/br4rAO3zTJH0geyn6Fe7q7ZXgqMQTT24kuwFMaj3xYa5NAP3GIGCfZuGfjm0Z93P+nkjanyTLMeTY1zmy+m4GB8AbAD3zaf3krwUN+0+qGYK+o1ngEWQCRq9WY49ZcVWWCkAmFLjAH1/GMXDu7yiM89KpDpkIltGlO8WBQt41lBeEe7qJOvr4vUKJxEK3cRtVv9bOkh0RSC8Alr4ihxpD/mm2+QXrOa+y0oa2mOjGsxLtsUC6XIokcs3Tn58dsEpl0iwIW0BxuYFODM1RyOG6k5/jG1ygMPMm2ClisbeC90BZtTAiPX+ihfKUaj/IgBGJjejIHRyEsUUtsRJ2bno5I+3n+fjIi4u93nEnwHPiEVaUkbddLx9J9QJPrEGL36ZS5Puqw+06ZU3FEhMVayHSFqvrzDY6Y24+EsxvtI0vcxkLtc7Mr1k5lKbuY5gvu9GHI6mtVDEV6Sfv4C51Mg9V/r3TI/ha7eocXiHHd</encrypted>]]>
    </text>
  </script>
</dir>