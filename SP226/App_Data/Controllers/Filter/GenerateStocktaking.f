<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="2" type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="Counting Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Counting Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="Counting Date to"></header>
    </field>
    <field name="so_ct" align="right" allowNulls="false">
      <header v="Số yêu cầu" e="Voucher No."></header>
      <items style="AutoComplete" controller="StocktakingRequisition" key="(ngay_ct between @d1 and @d2)" check="(ngay_ct between @d1 and @d2)"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="126">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110---: [so_ct].Label, [so_ct]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcATlPPbG+IBifCBIz+MvLI8dg4WhYKAWV2odJX16I2zmw7AUiQBznNdMp66Gzfw8TBptGr2RBhslSEhM0iOpycxNqdODjlc6PvuEPKK9xac4</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzYmQ2of9W9NefMX0d1RYzpYmeZ/xXgMzk6POjol8T52BS4Ve1f8YT3NZlFixZPeSx+qzjvVQ/1pj+AMu6h3VT0nWLvXeYCJunueG2mnW5gZ+1fE8GOgzETcKLQ3iwKnXYWnoYc9CC6QFvYRbZwQOdIRZAyNZUNl+LydZi1XWz0/GMggINOHm4IpI7iiCtRDFGyk68nqM1Tdp3da/4PN3JxSu7WBHUWV5pMsQCzlTVzth8aksa6G72aHlWgA3qRkqz8mRhZ4/Zd1W75MnaX9NjKc9IeJ6S03sXGVLJ6lm0rkxoSAEkyNV06gA23Zu7K4z9y9s2hMONV82zVFPR85ij2AAcWvRrRPNcymsmh2ZsYhK5K6YnLQK+m3ENq95e4yD4fRoADsKaRuvylRYPjJgmplY4tuDDw5Q8IcTLEsn/u2cHGXoX/o0fdKgFpa1DBZw/OMVP39jK/1eQGNgO3uwbfoC4XLpiATvgiY+73eTMbU9AKcUrd/1NA813D798AZjo43fO6swGt95b+Ou6hiG9yn+Xds0OVIagsM+F737HKm</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGVivxLlQD54ksVhMNu8OQZUhxzmXRTCFgti+LJ98lnH7VTSOxHEz+WKoo7OJ6OdDhq4rxuIXEx2AwPM/uSiuFA43FMQKGfGUA2n2FwdUq1UJxPr8BjsgUrKCL1y/wayOlM1cVGbEiPXsqY4jx0VKlMUzVLMV39Qgicru0vo7hzI25oJTQ6W+pKPUvOlTss4lJhXWbcAoVj0GuR1GhQOgItGmGOZ7E9Z+8rYaiZp+V2E4l6GBmL/fTwKguWDlwe0uwJP1hodDy29Ju46rofuneWrNiTj/Sasq7KfOf18A5Vsc4PMJOln0O7fqIGGm8V33dvWe6DRP83bHpIQLGI7YwfWPfRP2DMveUblb2qmbILhPPGXhNbb6D2pqLfMWxUrI4oo/fAUu3aNkcMRSrshnBS+1f9YTqvlk7FMvoCX0bTLYKnFGMRGdU2QpFLqDpiqmi242MaBRyX6nFSgjFmf7zII+Fnhlixe2v1cdG9UWG36rgbFvO2RK138MBW+91PN6BBtO3rQAsBahT2gC8A5sRX9RhQ/vb50MdzMTvcx+CJ1qjWw+9saQKKgcNZalpzaV3lf2KxCaDVPsZnyQOTXcbH0swjrtsRGAd+wi2vbVwm+C9oOthKX7YoQ2ujvTXyldqOqpEEYtAdMLzFIWRVpvuFQepsBOfA26OB7HdogHSyddJRmtj3lvjgALcopMzRobbJ0QWU7xXDrwTEcqVtVk7eSqhneQic0vznb8oTenJg7/X/Me4PhjB/JUi3m8SBIAtYGe5TG0vcRe4jIji8xxfpCRU3KIayT55VtBvQ8NT8fdIbJqe3L3aw6A5+dWHYE803FwfjxhFGePpDI9w9OlB1O1Xp+8oBiIBjqidhSU6ZRic7kjq1F3gzFgYi6qUg4l0T5Kh9WcHCqv5pIFJL7FqNV7t5dPzD99Vj3FmxO48/9eQR0/CkDT1XjoftgYb47m+9b7/ujBWyLfdtMJE+hcvPAhlirxqjspHrgVvmqw2FV8eaz8nQKRq6Q319uTl8nn82L+tVdRVzWLI11FVDeSW70gWLjYywGCzUZ/OxqP3GpaalEKr6Sm/qSHT6tjMSWsZrr86OAisYPd+AviZK0cuLbQU2GJI1c97ETB6S//VZsWpC9GiMp/V0UPx2Ni4S7XEQ84dybAo8qFiKrVh8xTwp8LwrDTFFYFKp2k+fBwYyn5a9U2VDiqEfsZQs1FGpo9GQXRUXkNYJdjkOqtgEwYE3YR2C605l7m1LyZiJ4po2XHrlpcR7n+jyely0vlp2cccd9gUq/owy3vfoK86WXb3XHEzmfblfZfyH3HjwG9yx+JYZzQ6Ge7hEyg0AlgIHajPRDmCmaQjX3DyxZKaFmXFckbzZQCGRGRioZpwDlwcSarl8dCbdxYq8y2jlbtQmL8xzNhfXBq8Xl6IGHc6WWnggKeTs3Nd0VWeS51X5q9B2jQR+WdX7zzXxns4ni6Ym8rYIXoW+J/+uviZXMKkb38cwp2r6LbHUwLRfsrPLKmboVG1BoY5cXn59Q+iOL1Uzer3yET+hG4QeWkJtCvl9kzXp355cP+BQ2sP8paJtdXvVPUs6SDed8+ZutTopyeDojZbp6wDfbX03FH1TpkKP5BlxhH4/ct366dg7R6Zixn9aKC5zn+BPXri65oDoKjyTUmupoapH3+R2O0hl3MCVbUPvgbqz0WmHIeOWyvKaqXseGBefmnaTl+ONBqjJCqhxUmVq7LdeOKznwZujzYEyt2ZKXAc</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRB0ltMBc4ZDh2jxMKZE5oZhqjYa0EwwlBSlQk7amjHeCYRM+p7VSxMqMml2G3bCww6XSFWNRHC8SQAOW/KhKMniEyNcCYzCT5UfVIbx8GNjA5k7eEvgvA6NKfrdWSffnAxmM7eSfHg43a6WWOez8QYhFo40ZLZWMOiiYUSqs0GYMDZIRrzuOg2pnAJKkBzT7/E3aAUkMlm4LyTAdaO/oRcD3PwMVgPnEil/qrYCYgGn5LbzvN9oSD76hsjhbQt1F6/3VzcPouhAapE9qKOzfWGueGdxGUSbnDSyuxgTImRpHUEh/Eabhy17jXhR9airdhN1N2D/SCrUIrgfNZxG1BXAT9mONhOedZUfgrLkh+C9I9FN4MwwktjtW/KqBAPbFNpCtwEEh6vQ05d/5SrPOu/3+vk6H0Xffdijrz2vZEgLV1KqU6XHeVy6BcwOmVIVdu7TfL0B7p4LrpAdSCMn1gJUlCW68NqJtaYhfFqWPGshp590ldHVuK4c5e497W6ZnuBlOhI2njr2HAg9Xtau03BmCk07egHFA0lOydtju7kgMII0AP07ulG0HoHu6kcsNWaF0KyHIl3lBukBRYlHUf/zqGHaz+7Vxu2cUbwU0/Kepz1OTBJ74DjVip2w2UZcuc6YwAsE5521Q44+J2pxZ8CnOxApxnNLcdxghN0EoKMHdJCeynGT+7TbwmJYslRfW+LirDlTHjixOE8DzBaDebQnN4KV8jSpmkerC5nzOW5wqtplgwAg0FQwSXi7nxS6HoFX+X1CEbNVoneidQ8/QNi6nXE7uPRbXN8DroSbbitL4VPbtwX3TYF+PUcooWB73hQ3AMUMrG+aafxVY8Erb4aiMdhopBHRrsmj+drERZm6Jaifo1Nt4W302YIjnIAKOrq11TsZtcL5ZDuuOYw/zehBOGRO2Q1eoHPxVm0Dodf2</Encrypted>]]>
    </text>
  </script>
</dir>