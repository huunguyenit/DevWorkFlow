<?xml version="1.0" encoding="utf-8"?>

<dir table="dmthongbao" code="ma_tb" order="ma_tb" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>

  <fields>
    <field name="ma_loai_tb" allowNulls="false">
      <header v="Loại thông báo" e="Notification Type"></header>
      <items style="AutoComplete" controller="NotifyType" reference="ten_loai_tb%l" key="status = '1'" check="1=1" information="ma_loai_tb$dmloaitb.ten_loai_tb%l"/>
    </field>
    <field name="ten_loai_tb%l" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_loai_tb].Label, [ma_loai_tb], [ten_loai_tb%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIXJw+y6RDyH7TGtu639WBSqotnv0YERaXWmGvaKyuEBzPsO5Zkxc3Wpb5HLE1NbRgv63ef9whHJABhaEqQHgvv8YXD9eL7/sc3Ub99eKE6v</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHmttEt3N+Un1w4Vt8hY+oSHOpf8NVuv5J5Y80JGtA02ZZ0jp89Ady+Xe1BMWpVBdjnu9iejmCt/4bfhX7fJ4eU=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHQHZ1sEfLBLAU7ylm0Tw/JLAkpjv0DOvfFeYoN68mi8r4OJWMVyDQ99KN/gqUoC8CQmU67DdLLxrc8zg0p0lh5MnJ9yh7TNOXRjLyZ+kmgH0t3azfwskdQaXExtgd8tj+OpWXmQRTzyszv0vysCBo230OY44Da8Wvw03wa9cZctio7SGdDo/hophR1Kbo4hqIH8cw8XqkJcX179MofKIyc=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdCZ0og3+rn/xGOd9dNjdtfrTW7jUz8jisrcvB7Cd1ex3U/txaD7ODO1JlgWppzbsws/b/ihGD3B55KnTy74NUFH81HJ3T2vh4lulZvstPB5eWCkHRPChLimkxIX4WFMBakUo2XmvJsy7WbUrfwBMySBBWXwT0yAIKN+0X8CBuynUagXNmzy1aS8O9B4+HaciY98FYcLM4AknoJMKTHZUdkMRS53KqNyc8ID1sY9GQjjzain33B66lENaJJ7+v20GJGjTK3xi1YNMwM/G4UYSb5pqR5NTB9N1KLtZ7HmxO88cd9qjq3579prxQWWqfuZUgAE6NGJvAiDM4zTt25K81FSKF1aLd24izneRV4ecGlC/7qfbv6Sc1zfkmQTRc7x9sYYpOs048udWRKaZGjdpLfo5quvnfG0oHEEwjv/BkScozwADixNbMQavBemO22NH0dOcSD9Q99D3MhdbM7TsgGZWyrcCBiReax0rGD084j3vHphjZ/aKcz1lzRHI/KqsoRxwDVB+L8ZTr9OV6wmhoBphuqbrTexXGnTv2/BPfCnyAuT2tWC0XrJBWHFO1DBpA==</Encrypted>]]>
    </text>
  </script>
</dir>