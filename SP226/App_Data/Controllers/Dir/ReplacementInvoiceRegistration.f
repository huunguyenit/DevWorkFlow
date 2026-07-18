<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "ReplacementInvoiceRegistration">
]>

<dir table="hddt01" code="stt_rec0, stt_rec1" order="ngay_ct0, so_ct0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn thay thế" e="Replacement Invoice"></title>
  <fields>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Invoice Number"></header>
      <footer v="&lt;div class=&quot;divOriginal&quot; align=&quot;center&quot; onclick=&quot;showForm$&Identity;(this, '0');&quot;&gt;Chọn...&lt;/div&gt;" e="&lt;div class=&quot;divOriginal&quot; align=&quot;center&quot; onclick=&quot;showForm$&Identity;(this, '0');&quot;&gt;Select...&lt;/div&gt;"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày chứng từ" e="Invoice Date"></header>
    </field>
    <field name="ma_kh0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh0%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l"/>
    </field>
    <field name="ten_kh0%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="t_tt_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_nt0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số thay thế" e="Replacement Number"></header>
      <footer v="&lt;div class=&quot;divOriginal&quot; align=&quot;center&quot; onclick=&quot;showForm$&Identity;(this, '1');&quot;&gt;Chọn...&lt;/div&gt;" e="&lt;div class=&quot;divOriginal&quot; align=&quot;center&quot; onclick=&quot;showForm$&Identity;(this, '1');&quot;&gt;Select...&lt;/div&gt;"/>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày thay thế" e="Replacement Date"></header>
    </field>
    <field name="ma_kh1" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh1%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l"/>
    </field>
    <field name="ten_kh1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="t_tt_nt1" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_nt1" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec1" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="cn_qui_trinh" type="Boolean">
      <header v="Cập nhật qui trình" e="Update Reference Voucher"/>
      <items style="CheckBox"/>
    </field>

    <field name="hddt01ct" external="true" clientDefault="0" defaultValue="0" rows="220" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi tiết cập nhật qui trình" e="Detail"></label>
      <items style="Grid" controller="ReplacementInvoiceRegistrationDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec0, stt_rec0" e="String: stt_rec0, stt_rec0"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="280">
      <item value="120, 30, 70, 100, 230, 0, 0, 0, 0"/>
      <item value="1101-11: [so_ct0].Label, [so_ct0], [so_ct0].Description, [stt_rec0], [ma_dvcs]"/>
      <item value="110--1111: [ngay_ct0].Label, [ngay_ct0], [ma_kh0], [ten_kh0%l], [t_tt_nt0], [ma_nt0]"/>
      <item value="1101-11: [so_ct1].Label, [so_ct1], [so_ct1].Description, [stt_rec1], [ma_ct]"/>
      <item value="110--1111: [ngay_ct1].Label, [ngay_ct1], [ma_kh1], [ten_kh1%l], [t_tt_nt1], [ma_nt1]"/>
      <item value="11: [cn_qui_trinh].Label, [cn_qui_trinh]"/>

      <item value="1: [hddt01ct]"/>

      <categories>
        <category index="2" columns="566" anchor="1">
          <header v="Chi tiết cập nhật qui trình" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCOrNAhQ7z4EAlNrsxYKo+H7CQpN3QNmaobNu6pLzf57</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMjEitWCiBAWcopg6nypxirG22kVK4Mqm3+MnWVjVq0Q</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/jUWd1MZLckfuFpma4XxWb6z/gBGutyp0H0JI2Crlm7Hgv2NIF3Z77+wGi9LNeCR8riD0VvA9xg+O46IN5T1b5xBakXnLgl6P1lHl5eJTaMic/I9u9auz8YzJWYJezfEkpmFVupWmH0GHmDV3gCXZaOasIMfn8NneI+B0SFKGaFzSqTPWjWf6ROziuJhRGfZfLjku64tCkFY3GZdTIDCt0qnZinlq1v7ohNiUIvTk/nJOvh+JDaSld3DyWwjYu2kfTtd8Q39Hpvo8paNZRh8XI7mkdEM+gkkulatY0e6ss/G2r/qhzy1+9r/jdAk7jKVCgxMM6f+fikSqMF4hxpvp6tPZhaolslSAYrlchKQVttg4lMs7CeKVIBrmnXiqNOfBhQNNQdtSoYLCvZpG61WiwLAOUxcQCT5Gh+V3ZTKiVzPqOGPSo2kJ2iHdFqI5j50DfA3Ie2utSTpdMzeNe3HYdPhvnkX0cJ30hvkMhALJxu46I5jZ04gHI6OBWicLppPLnCNZmdt8RxlcVGK4mVALWMsHVZaOQZpRmKfv1u8FuJgdBjp0OhR0gEw2dzp+/IFPijq/epHK/ePuESilgAim9ubqPjo8krEQdPmRJtEtTOhpRsmb6Y/na8zP31/34fz4vNCx/NsJgkYIwjDfcagQcf8+mdOy2NEUNtbakdfmEnY/Iw7WnOvozy7JE8TRpMLHtcx1qAz0wJbDRX0uC0gQd5QqL8RuHHfB+2hZXVP/XKjkaAnGBL2bcm6AEwnUhRbN4FRQ5kuJxxtnFcCigh8MHOXsLWeLMzDM3yGgQYilvkhcp2HzhNK1G1F1HZhgnC8tT9S+2cMirRLYi5DfGXWEIqQv36NouQfANmqnrKxw2u5K5SUIXPn38Wamzh7x24alUtZ/eZ2fCpO6ui0BABJi5PAJHuelW4KnsN/tEYFQR/</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CiWUrEUCWPXOkLQkTZznAqlBIuctU7eR0K/WfsQOLNOggR1Q1D3Qr35cnvRB6VtDWDTHb08jDYPREaeTv20OXz4XcOridXSosA9WOh6B6N9BjyTLZDCxyK3JpSjmHsqx15SYcqhkhSy4P8pjHk2WVdweSyUVARy6vwwD8Dhw/So4udZNoEl3z76CHNRBmDUztOwGMEN+XCT8wox4/gzRVSnNu58LDL40uSulMqmusw9f49aqVzdL9lRPeti/n4QnRXtryqocLxHQ/YVFaomJilZSY1EExWTvCnwpC0EDjSA3OzEZlQFQD8YM+5WC7vfpr6h2Wt2CaP+4Z2yxwWvjOe91vF1pWvfMtD/KiWNh+NH2e0RSTnxCnQmAbEgtaSKzHDo/w5Pw2QJbp1y4suQ7NkMPvLYkb1Xiq6iVKaYaudkPcXuobtvmnithBzQ6cyv3PAtH/5+y3/Y6TXMSeCCclBYfbgKB8+r+0dQgiA3JmvNnh0GtWgQ0ciANX5V8oXdsbkef3aV59hOra+vuBcGBypUGcwHOgQxayzLbwhnM/2HQ8WQ7+sN7Wen/D+u7PGniTIDVdOF7wvS6vOtjepLsvj7ApnDPcqgCjjcaiUEd+VDnEPxLPmOxnVLfPdJOEOmlEXfR+HZRd8RcuarqaOcKihQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0ifQdHfl8DCSdSqeiYZzyO3FZf8UR81A/qOtvsx9zmOww6Pb8LeU/95aLtNqf93w==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteX94+MQfNPWkvAEIFko1mS0/Uj+KdCA09eIvoQ+mBz8bxhLheixVKT0pYq0pLWB/Cy/3m/5GoJvst0wh6p3EVjOcjPl67PjibZ+YPL2eI0HCKAIfW0uuj7EE/vUGNgBxfZfGfr7mtHfBp4QJl7gT2fJxO5MoCa35AmFpLqgznoEXruDVScSl+SoKsYQRiL1TAx2SDpOyVKGigHtljh+toa8YazRrfZSLXgHmHekDh53ZdXFriZ92dLNxwhvm33miQrJUzPm/JzCM0gasOMXK0yqD7rxUoLO0OPjJz+TJNB0lRiepsjn1pUlh6s1zDA3wIrnJVHIg1LlIb2fKXnR0EJkxsKrexRlOckK0uCYUdpI+7ZqJMgdUNOgDDwFymGPvRPs7Dny54YXrGI1xgqNc3XjDAqw2SKnUQMnGHypqStSHLzeEgqIT51UB/cNeWPHjTecv2PfoEr6mAm2RAtErUii/S/wtbIOYXoiaqdiLt8NOVrx+ElaZCm40yLrbQh7C6hfldbhmAYYhT3wrsWWBt0s0AIvmkJsXXqDTV0Gg4ryZiHPVqI+lIALlCvZ6P0fFnINCrGZ7ZhVlXU/JrWxyj9OO3/3M/Kq9KZH+LH5LVYo6sJMAJWdvqW86Qs/V2uJ0+EeSPFiytrq+LWpjXuYW9dU42/KQi7ZHnOFH0QBd2g75bDNgBQPPmWis+cB+GecVSjvUG6p0EtD+cIBx3ORsxpQoSXRFWxU9nryDmFUS//yG6D/DZ0Wsk08gF6NNL9RlJFvYz3q+g7WDsPS1IfpO89SJzFVEq0DTgwCwhX1bz8iIWWpWLy7UGXMgFuFCN7IFC7Y8tl16PaQNli17vp0pAoeKUHBwkBhkLthJ75lGcKapZs74kKZt9zVZJHhZhJjg39HLkaKzpYDJ+y+ryulJhUdOTJYhFY5F+Ll6Jn6Mjd/2BBnUng2Z6zmuivbZKsJOG1T7h4Dsn/qLp0N20lU9BgF+sxU8XcWA8iwZEBceA79ZiDo0de1Cw9YKKgY+08j+aVGMJxRDB0M9w4+ldxSfNg/RU3SkcmwnjMP6SWOX8cVGDZQ4gPza5UayCfvdinRhWauJYV8ZWPmHu6QVhHmvSrim3GSJb4Prb+IZDYUq2tzZfw+356swnICkTp2+oLTh950P6SgHaF9FWFwyGPsptou2X81GRoEmynUkMdZn+bV4=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHWsHGECEFDsZ/fJ5XtD9tTcmw2H+ADK516bJ2D06sE0zB+7DZoy1Hxjiw/JSQXnSvq5UR9yc9quPpAt59uuyOJdBMvkLNjKPZhIJCq0xE6OugNEQ2/eCTzVimP/MrxHpBsecfQ+Js0kT9+w7mVtdImUyWKyuCiFO2bu/bsBjU19FrpL2gCgEbfj35R1U5eZNZuK6AaWUCl0pW0IXNLPHmvQ8ZOzKAuMXA5mpTtkafWmOTAuIT9DhyMOiAYXCpqif6ra2+7Tt7lDqxzqLGpcRfU=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGVium2dQgIDDP1OMhqfOGhWyf8BMF+Ov3t08iT9xJBsGtA/8ljLIflEiQowAv04fcnJ+lk21ptLs6uUoDrjwFVwYrgPBS/oq6ECzN7TRZ4QhBwZ4d4AcpUXRG69s7g8plFjbmtRuQqQ8aoA+L1qo2HdJRkmsVnbj37FB8NqHm5aixejyMv2EKGibzkLtW2717cz3NofWrWxPmcDDPoq3cnAc+YjJ+7meeyVzJwJM2Pjfi4F3YYRrN6CuzLLMiueEaREyFIdi7l0sAlCmlDDc7gULT7IIgrW0ZwuehL6EkrDFmBZmNnTLVq7imAQGcDgmJrjv93d9f5hzeeBjLh/+uDxhltnVh444d1zcazhiVF3Owlny1ZPjeNmNIq0a93K9rKofb/0alJ/KBnCYd4tk8Q8xWHXv4MH6ZmuXhoqNREPONM4WOe+zudZTEXF1kAYiUnlhjNFWQTs14NiqSfHvavtPyU037dlwggYEjess2kDDLttjncBEhOSTLr+VjJmAN0Lw=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkDXlQjsnt8mKTX1NP+Euow60Sp3LEIveoKMyDGCP1gyXOU42quFEu0ItrruC7GUJCDJdSgyiZ7BfK3yN7mz6JhIosXPjSMGzNtC9eG73EmQ6WYrg9B8fw+bEU8/L7kf84+rMkExhJcQMp3tUZ22PwUbFadp8HPBq1XqYIklybvSt8IxRU+86xIt8ez9G0EhDpQGghRDpwR3n9GXzXB7zaWfiEuvCGhDivND2KKskot3wCAp7LMEddUbGOKcldWlfKQQKx13Oq/pN42XagTXc15HXU+8MbScWecsXxIbl4CCQbdl6Ihbx9qsVut8whB2VQ7UKbKtMyOmMW/awv4KMyBiwdakbeRgpSAjqOAJpl13ojUJ8LKkfu5Ko+39TnCzx6QyDmp6fAAq2iMdJ73HXmleIk2uf575rDdgyxEkBy18u6AyPu7AkAuFMmrCtuQz7zuTNRKeKFWYxdwbd6tAP/ICmU5RqDY6ljtOzk27/DDOilY1EJYdOHsGGfVP+RkqZNl2N1sMXkRKgQTl3zGG83NgsWt2U9xK+vvVY4lQ4+Gvkb+Y37yyovDaejvseeH6sRHqZfM7xCZRRIPf3ufWhcdg9MqhT6yyDE2y11DK9Ob6OFYcE2xMDnhOStz4MxDc86Vxh1nhlON174nqV9NINK89DpvK9NofkP/n2SPzuzJgCXma+ewbLDDDAQX2BX7vSpiw8dGEvSAhQZNwRVxe8gF8fhfFKVKRRfv2qF3AXHFZ5RJlSQGGsTVlKrwmlOrJF2az+g8bp8lr6jScS76HA0VkEETJyMh5zNa8BoTDSGzUyQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l15aO01HH673awFvT3xukt4UDwKL6KXwLjcLM+U4k+E+9/HCLG8ghCGex6NdBepq8a9sd/yz8XEEdp0r5zSI3lPPHUrQ4NHMIWWWuoBpwYR9zHurwRM1Ny8LjYLTL+w5wm/KFAac+G6CP9EVt9C+Vs+fdvpfaTspmJSVjqFAI/CWHwtZXhC/kcN0PETo+f8ABm6KFBymVqHSvjNxMNxTA8XRnFyk1lhvIXHWqxKrOY23CUAIcY0IrXWfCxKr42gIgTRJri/NCWYzw8eNkzrKSia734s0zsGCTex0yWuPLaMg941y4T3xNGnQZzr3F8OdyWYNcsANLQTURMwoJ5IJ1oSI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l19tl+4KqIf87Hz5gMeE7Fsz67K/jqY7xoIy+dX/9q+Eg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB1z/cu7zNWsiSuFjkSYXYqQB1GMslXY7HWkQ+HuMw1rUIyQ31JJZc2o0huFYmhu/Ew==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l19tl+4KqIf87Hz5gMeE7Fsz67K/jqY7xoIy+dX/9q+Eg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB1z/cu7zNWsiSuFjkSYXYqSw84soVElTAbqD3cSAIPVECaQVDeYEP9M8Z9g1FBz5ew==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1//9so+kVLKunE1XUQZUbsBlck5JfN3vhXG9VKGRShzu/nFQx3RKdzzlUYgwGqaPMw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&3MdUz6IVytcxEbFjy+1ENeyj/9+pwFrgB1TbYF3GMpVK42q4vo1VGgcwzA2dead6fZ/C+3bTXUVQ45yaPtyhdc4/46FVbMYwPUoKmALRYA/RYjlP1kpzPX+jLzv1sDMRw13Nf6Mbg7vSRi4Y/LOfJ7YRji7URL43sIr46MUIC5M=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3grgrn4a3NGQMsCYIodQ7Y2h0jyInGlO/kPv4ewHy521X4o5ax8IagmQXVcWy47eTQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB/lo/sZpYe13slkCoMkkV2xuFG7hVqrh7xoutwuV86546HqBgR7NbTF/VMdfy+wyScplELC9rsqB9q7+NO4JtXL+i5vf2pai9QZ3LDgmi5Uu0B85MmCml4pyLzNa1OT2NZELrhEu55Y03KH2E9t4wNjYcyMjTtdh6ShHQcLmh4+M7EEX7CBzdhqJ6VDNVT9qZuew5q2QeVel/SjInpt1VNGobkCk8lsngV/tPBlvZq6ehvv1ee1zTEMoR+OWUYmz3T3NVR7yWH3n+rWQei1U/DH7ICAfqii2iaCS9OMOH+VnkyGbDZ1wVTapAvo5jM+lxpGLyMIhlLuK5gyHANtWakid/oHFfD2mUQOHa5bn2Fn/RQMGlLpjViDsDMm6HiUrqQTqeM8hzh46yDc0G+k3gGs+NJbqVvusAUohiSQmarPzLSNe72DHq9hPZA5RS9+L3Q==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwATXZ6CJSK/G/BEnWxTAMI3IpXdzTQSoarLw/yVLcr7d2kzf1F0O514yDmV1quc8zHUrP07bxSoZsNHIA2tWWJvAoFR1pue9VH8UUDHAQuM0mVVxyoZfrCC/11a8BQEnALV/+Ybv2z0tFuCJ/sk6dTlFmgqe+Kjfl03LyRI2Jo8lbKQmCeDPEMPTiFjOsqoU9CM4ROWEccOHTJwhjUtUNTR21H2M5eh+CqF4pT5EY/HiEOGTBnBsw+YJ+g7v2v9VXowP+UxVWEkkgsJnOZwjQ8=</Encrypted>]]>
    </text>
  </css>
</dir>