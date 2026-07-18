<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY d "set ngay_ct = ''' + @d + '''">
  <!ENTITY set " set ngay_ct = @ngay_ct, user_id2 = @@userID, datetime2 = @dateChange from ">
  <!ENTITY join " + ' a join #u b on a.stt_rec = b.stt_rec where b.period = ''' + @oldPeriod + '''">
  <!ENTITY where " + ' where stt_rec in (select stt_rec from #u where period = ''' + @oldPeriod + ''')">

  
  <!ENTITY Key "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+4nXz3lbr6yDZIawc/Xso7QAolUhQGyivITZWwuEFlxX1q2Xj5u/Dmfsldf1fcNmtdx3EdvvV3TdkVienM2Btwi40T3hNzDcNAEjMKy7E2CP2Kpj8Pob6I9/Fgrl0N3eB7GOtOLPhbRTaggDqZXddR4UilZQKz4vWEMVwwo89hFOuC0yyGvLyffYWANPnXz58A==FastBusiness.Encryption.End">
  
]>

<dir table="c51$000000" code="name" order="name" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xác nhận" e="Confirm"></title>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>

    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<Encrypted>&i8xXBDxrUicbWBNXbvDJpliUSApVTzvNdiT+9b8CvmXDltvBhUQH36jT0VaktnNrg0qaTW0ujiw0weSAP8BIvw==</Encrypted>]]></clientScript>
    </field>
    <field name="chkpass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="note" readOnly="true" external="true" disabled="true" filterSource="Optional">
      <header v="" e=""/>
      <footer v="&lt;div style=&quot;background-position:bottom;color:#4682b4;font-style:italic;&quot;&gt;Lưu ý: Chứng từ sau điều chỉnh sẽ không được phép bỏ duyệt.&lt;/div&gt;" e="&lt;div style=&quot;background-position:bottom;color:#4682b4;font-style:italic;&quot;&gt;Warnings: It is not able to remove the approval once the adjustment is confirmed.&lt;/div&gt;"></footer>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230, 0"/>
      <item value="11---: [ngay_ct].Label, [ngay_ct]"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
      <item value="-1000: [note].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6i0OpnsU7v6Q4B5hJmhnzju/Uojkq4rirliqQ/bVbcIwBgOwQ4Bg1t7tijNHCgOj8WGw7EAhaiAAzyG14JL04yaUHuacdSeO8WOhgW4wXtSLM=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPRbB5mzzhVQxydv75n/Vm2lFkhV8N+l2A90R772qeVMSMgAV4P8UcTJcYa1OLzXOpVM4v/BUPa2a293+KogQ1s=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WRjX5/6Pf0s6QTuF9Uw+uMyDWutOvw9S7cnNV+olGuVc5+C5XTHkKRWKwOPsG58SCLPBvqLe852oqQL5QH9G+sxp/DucQowk/yPhZZxjxRqdnTuUOj1/nhSehGBq1zuIrT4g3tJWsXsdyBedgsJgQH4rj+N0IvpWGC6uJeo9iIMRsbTqPlQXvGX/geBWAh+4veoRrLczTTWNoRUxuxMTEk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WN9n01nX7Qez+MzFmPCM1cO7LtkA7ikf8hum0xDfrf5PLafwNb2Hacc9PiyyifZsFGDaTyWD5F9ZEMUsYSXANw0i9fVPN8sSGrvg7AtwPLXvzrb7IEFwF+1Vh3PqN9uOAnX+E5yXYLGrIb4B85cpvZSqxemTt+QzjBqhbdUUoLs6IXTMt0K14hpmlp3nq28KdzgzzXWpKMSfK5ZCGX210N/1CgYzYdxWl1dmsxa/Ldu/3mwAo0PKs3FVTaPO5OSDyZCSegNGqH2DmChsueMbhXkY1vJ0MTNLEuwsKki/htfHMmB9859cPmYQtO574QAao8ukWBquFXdT8E3lZt5aaThKNWlfRRI1JSZoI7dL47km2+ITjictBeT8MPSOdKDh+NA1AMXBx6qs0EXA9CNuq9mtU7njO9HnTfDoezlpxo4RuvN5AsnlParIT+h5b7BhYD+li6ZRGPCTGv3mAuOL37UD/iRPU6sIzEyydBkEOlrZ1zLW75j27QG3GB4XLOiValrLQ+U1yNA6jer/jemSMyLd8UMbLfac9/tC5OmoGNf9cByK21BMmvlfil18XST1mQpOmsOY7JABy16TA8cuy5bw1ZHUFonrJrrqjNdM/0QGonyaR9b00t+ZIjJescDHLquQTJ6RLlVucoDX7Dlz4J9BIQns4dM/QTVJLUiDQx4AU+VOGpvusKXQps5aGfAVa5q0+whVBkoucVDxuM49gpbH9dJyHIQwdpHyIiZevGwtgqPGGvcO2JI5WU5awrRoawPTVHP3JjkNcVMaZ0oYKFgx9rQiILWpQ35jE0azKGFI6SqS7fv/H1nKQY44Kn0PAdYvYVdaQ+YjV+rfeepsvBsS3NqStk+8LLOhvjXLLKWmRzJ7ioUQMTk8AjYo1fQDZWWrx6OXIGBs269yXFO8Y5LPa+5vgbNDhCR/ilUgi1UBfYRRJ2IPyST3vvfxGmo+E7qwuaOB0Bi5upCdkFOxwZIdy1ueS88Ebs4/+qOhgEavvYxNm1cjAdPl78q6oRN+aob6A4O8c1DDxP7QztoE8tSjJNSHv6SKH4Cm1L1NUQYNIwBtMDJNwKQWvnORtm1RTuFUg4CnAl1GhPPAmfF1Rw0CmXvqVtE5bwUkf5+fGx/JJ0TodnOqS891Ftvk4WyvHh4XakVvAXVjr4JFzU3phOXY/u0/RSaBrGNK3a5dgmbdhQDIJM5Ss6HGAF4qRry8sEJOl4PU1SkHi+A/PVmlK04Sm0FnZfBJYni3hZF9NCC</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSBQg/pBQX51W2+SC6JFeQlYux5/aJVLXn3tCW+LRjpfAIianrkMuFLLZ95pGw6gw==</Encrypted>]]>
      </text>
    </action>

    <action id="CheckKey">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2QFC2P1K/gBCoiwOZkDh31ai1fCIQGArLLgWYzIt0jkNsqh7ob8MrP2CF+e9X/+iPcOhieCfYFZERiaQJIh0XAUriVNnCzT+Vwgg2pcWDPtBSziZhbq8QqSUNUR/PA1v0Kjonrp9ascrICM0l79ryLadETLrITsr0/s3HUF/EP79Fx/T8J6noW8qYDdf1H4EhxQNO0osV9DAgzDRDjboC4=</Encrypted>]]>
      </text>
    </action>

    <action id="Adjustments">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbMucwlGQsem4+PumEiL27ohO4NumprG+khFiq64aOtsJBJcoJ6xb7bbh5Ck4/PXM1DWfIfR8eRZF5m0Co4M/Hm/vKUUkGO2bkB/VfjmdnADv86lBDqAXuef70exrnQA5vEDXIgJKtvSwvPWYQgLcENRE1M8Q/RNOEEi4oWyLhGs0wgsIqudAdFs7DMZs05hQNmtPK0u5kwkT9Up9d89o5+tW7kyxz5ScN2VqczAPYoWhxnNdgUVBlPm7WEy+UXf7RgMHY+3GR0EytO2TB/+GPho/BW95FctHqrfwyTrGmqp8VjocwkvlNWPTZuoZfVO1vsuzN4ZjEcOD4DnP0luO6w+zgVOgkh1m32sM+Lx0eU6DUz6sqWeIQSGhWEVkZjMEoGwZA4xEHnGhdLoSbY+4e1zfRbTH9FnW7jhT8X9v5+XrfS8A/H4aLRq8PEUFT4K63F3F0ugKZzPKf8p6TRjHn0s0G3bJ60m7hu6wMKjxy32+Gg41rnqHfihwxs3vNTVunc2jci0IsuO0F9u7s9KsbaouY/koyFR3DRBbAGiAQZz3UpM7zsjMsfNCfXSRazS04PPWcF78uY3BNbIlk+F0hTDlmYfg4+B4C5fT9usWm/64pgS0pGSsbzpGHLn47s8ebpvz/NQ/wEeC1+3TtUUi7TX38/tVyVQu0hLA7vhXxvAJyzMn+/YDlSRyWjm54gBad0veMrlmBxT2XSZ/chhgVLZHAjloEPfGoGOw6RoLaXE4OvBrAQLpl2tXXdAQ3ZP12Hqbu9b/CTlTKPC/HHEzX/Ftsqynew2wDDeHrKl9zDUeUL+n/QHvPJ48cXXd4ZTJgDWOr96t4T0CFRNu7m7dWdQu+XH8gxcuf2mrjMUd9fpPG3B9FnW+jekfVUScdQU3hoGyp5ZpiPoti0z1n8ov2ivGc4eQLi2e7lenxestzj1I6GyyD+rkk02rsBLVNpWl22Wb4SpEF2rba1uvsp9klmgG/lHJNYxiyPQXkBvFa9xxeCoD0FT2a+gCi0BS1bKHPkEBry/gHw8u6YYM5M5FFhxCYP089OlRxL24zMzAwfon+fu/Wv2SvLqou0H5g0310KbdyiI9Kka8bMjffn61+nfO4AJzB3+76Cl3Qo0V0BuQQE7mKiF9L48zPI38mMtEv0AkObZWW3BPGjV3q9ejitmmqOZgI374B7T6R/Sc/vTIhGv3xnztayU7WT5qVZRvTVTjsKd6TPKf+vLGQh/K7IYn0nj1s4P43X4mjOQ7yiLwsGQBBcrXCeDXskVLNSI7sADBZnfXiOXGfARfNNpmPk40N/OHXpjfNrGnBGX/1AvYHNDlAS/R1Qxhys5Tr53kTN9tjChMe+Uqn6rNvG/5oG5RaIW8KQUsT6rS0G6t1budb0piPEb4PJBG/qNpTAlWeOyG4hgt1CeMS9A0fA3okx/XlYYkrSR5LsjY2KVMs9wLoEkUadVOGZprij9Kis9oGQY5Uq5uCJAB6OzKF7Y87Na63AWEw7cjQpLzzOO3vfzAfJUXldoa4629CGVDENUOqyj66j13o4Wl1BRUQfZBd5khlr/H3IV60FJRNNtiddOw=</Encrypted>]]>&set;<![CDATA[<Encrypted>&w5rl2nUwASgcMZyFi1PPgZRU2uQ6tLhhYomIjJOBl68kPXHDNJSxi3LzCJ7GzSFmEzVK6pA2gm5FqioXHnNh7tX9X2g9RtMrQ1s4kbKLaEw=</Encrypted>]]>&set;<![CDATA[<Encrypted>&kUpgf8w2LdnKikN+Z6VKapbcqfZLvE2DBdmPDa8PYP4c7I0P13S1QYxrkbTzzY/6tcJrcbqNmrbaGsL187UCZKki59XhOMMQBlYnpSEeOBE=</Encrypted>]]>&set;<![CDATA[<Encrypted>&hjbYznSGZgdIWj7YCQaDwA2ha+k3hS/UU3ibO0aRQLoSWCeSiJxHlikW8prwPb4PwS4q9dAlslM9toyc7XNlfcjeBJqoc7WN2ajSSeaTjz0=</Encrypted>]]>&set;<![CDATA[<Encrypted>&hjbYznSGZgdIWj7YCQaDwGKp+Um4CMqMbn/Ez1VJ75+QjxCwe7aMde1Az6E0s6B1V2Im//vw/ON58Mjp9d+vWmFUM6sUReqNMJe2/OIr+PI=</Encrypted>]]>&set;<![CDATA[<Encrypted>&hjbYznSGZgdIWj7YCQaDwPD33GhI1UPagEI1lcVX5vmTicWgqRND3JUw1idSLEyb0MRUTMNyRaVISaPQoWA3Lez8BchqYjFVMlEnTeTXHfkHcSNSausILiALpRI9YxOP4wOvazCtHwg5o/Jjef9uhA==</Encrypted>]]>&d;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5KW6X1AuWzvSti0t+2E/T/cjKKeSmsFXNDuT6BoTet6yKYVFBpLrQwI5iI84/WtClnGXZSn+68ZgYTkXZqFVYlt/crMU1oVbGoumG2STD4UlC9hFOuTMe9I2EojdxwlQPvMtsa73MhbfxObbuLM/KaYaxia8XKxCfmy6nX35yb+gJo8iJaq3YuAjpXyV5RruUGxiZ+ych/QF7LsY4xw2/7/k3b4jYnqD7jB+gEeGxbTcdykenUMWSDoctiND678fx+6Mfx/35vNyJnVBsmMb+VHE9orwSPTeJ1yjOL9c29AFt+nS21oOvN8frmXi1jZeRchFhrgkD4Ow3/o91bBxXzbcOM5c3TJHV++y9oy6IwmOrbi6pLc8uKQtFclAMUDShqaa0Thsr6Dr1FZR/CuJ1cpIo6Luv10IwM9/xnjC3tFxoAFH1Zs0+cQEyQkpvnBpKZubx4ZIrhuvT+Hyvz44rIR9T2RPWUv1TuVXE9Tmu1CLPAM7CgX+JhjE9Ftjq3xVkxgQSMBYXCTH5tPInQMG7LDkMdcqKgTXPDMBIyhemOAO</Encrypted>]]>&join;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4el7jBrW4jH3GdISJq+PWpo4VqCKR1yte0yRKCzUeCxJKLrJorZdWW1BwKp0msOHlOmoSpu8XiSU/L4jlZjrXp4=</Encrypted>]]>&join;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XIutq2HpqtvautySFyNp2cqVCrYE1datKR1pnjBAkDnPqx8un9nXhmFMmAwNtdFzs2zbKewSyKbsssllmVl7sk=</Encrypted>]]>&join;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YDOzk1XWSpXmRiw5BbVFb3FjXzvMsLOUyjE1Pqd1w44mZW0cU42exHZnWt0BmECXiyVKgmBeWOPQfhMhSgSyko=</Encrypted>]]>&join;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X41QTkD8AEcMK/auLTd1SnBCKYbUtUYEsznk5IApMnOaaBQo9wO+MBbTA3gQpqXede42UTwmnGOnUB7RP+4cMU=</Encrypted>]]>&join;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22btW1aEjtdg6yJTDjeRrr1rUOs0HSC3Qb4Sw66EgB7zL</Encrypted>]]>&d;<![CDATA[<Encrypted>&xnl9N6xCN61/EUW97QNd0NHPXYmDEl5Bb4QPiW84t0krBL/QxrUDvqHigXMuaT5xoeQrXKNnHZ6e/jOWjPteAMsW/hQ+OIusNO7vWOocre7AbJe7LLDFh0PS5a7fRrca</Encrypted>]]>&d;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4enX60gKRWjsRniXTdgwQp3zOdJx336C4bD9hqx/aE5+</Encrypted>]]>&d;<![CDATA[<Encrypted>&kvZNx4n/VcU/vX8JVap+BhFkz5j2uhe2n2Rwd2iB9JNXMBAD8K2gRiIoQ9NLm3yTaoFDxU8rSxdSaaqeKImdtkfXsdaxHCdPO92wXVH7EHU=</Encrypted>]]>&d;<![CDATA[<Encrypted>&xnl9N6xCN61/EUW97QNd0NHPXYmDEl5Bb4QPiW84t0krBL/QxrUDvqHigXMuaT5xoeQrXKNnHZ6e/jOWjPteAFxL5e9p35tCLeGM/t8HLmdWVg+hxHMat33z9vEvnduC</Encrypted>]]>&d;<![CDATA[<Encrypted>&xnl9N6xCN61/EUW97QNd0NHPXYmDEl5Bb4QPiW84t0krBL/QxrUDvqHigXMuaT5xuXG3ukk+nvmwo2v4sz/7Kz+bsjWEDlFNRGJwrHQS/7R9amgJhWeUKQu+yAD+sP56</Encrypted>]]>&where;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d503GJNmI/CTmUtMVgHHzpHEFVkBg5dxsM7BllMNn1f</Encrypted>]]>&where;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Vm1N1x1l7yzcHy2MswElsLdH2BiAksyXhYPmyEhQuwAYvk/ZMonU0siVfj2u6t3CA==</Encrypted>]]>&where;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TOAXZFLx1abb0sZpLbHHXkYheXVE7BrdVWaq7H+JLk4</Encrypted>]]>&where;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TOAXZFLx1abb0sZpLbHHXkVmqwJhFkfU29g5bBIz41t</Encrypted>]]>&where;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bKwz5gFqqxM1E5NpSexyJ3nudakIRLSf49OOXhmbSp0g1w4V5UvtawpoLHcsQ4e0vNPNN4fFwmJKIeVdtTHgtPdkBpRl72vRFgkZXhf6kEUbWYZLbBAA97rnXV2hktvBiCogEAr7EG8o51myPpQhFMdOFwvFu2Mpvpz1uqPm3GGJQSIN5HNeXxIkdMN7L2Ka/IaFcrfm15hrD/Y/I5AVca28YIXVmO7YmXrUUIiHN68wcCK7qWpYCfEYx/xMnYaTB8jAHaQW0tmOETu52pl2XzCwBak+scNvTzqIaGONb38GxBDdrTTmNvh+yJIbshavcx8PUDQDPj6hjQ6cDJ8AUw=</Encrypted>]]>&d;<![CDATA[<Encrypted>&xnl9N6xCN61/EUW97QNd0NHPXYmDEl5Bb4QPiW84t0krBL/QxrUDvqHigXMuaT5xC7vaQRac8qNaeVDAqGIBce0CH/oguDdD4iGIdO8BaW1/USWt+DILU4cnHHuNjdxTIp+MAXTTnjp+J94lteCyjYACG3PD0+2Jjl6gvuY+ChhZgAGeERwocyn6bfOWeyfi</Encrypted>]]>&d;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5KhDM1NRtbtW1+iWxzXZlrUCl59nSGTGgaPbW88VGEaxHgJrTJLQJ67HjaxlJUDZcsBUTaoHocsHJhyyDlSONHB+oBvDJeW+kxOP9hPWifycFU1J6lRwOQbxbCJfKAIqXQ==</Encrypted>]]>&d;<![CDATA[<Encrypted>&kvZNx4n/VcU/vX8JVap+BhFkz5j2uhe2n2Rwd2iB9JPPX6altfjdSzUjTb+w8eQayNBwgwQe7/JQqYDrbGSk4eLDqzpd0/2LRj5E5Mu3mrh4McgmNEDNzr0kpjoc5BUxwZQOpzQnnt/ZCEWgnslJltOXc+HYFFzHvX/wCvYMPT0=</Encrypted>]]>&d;<![CDATA[<Encrypted>&xnl9N6xCN61/EUW97QNd0NHPXYmDEl5Bb4QPiW84t0krBL/QxrUDvqHigXMuaT5xC7vaQRac8qNaeVDAqGIBcYhxKuKSTJdLxurfoRLXiWLXMecmpHYit+2YIw2qzBUGU5UZR9zl+HuqMWhpire7HKF6yiPxF2txF8QUoogIXVRcJDOCw9jEOUMX2RDy21LX</Encrypted>]]>&d;<![CDATA[<Encrypted>&xnl9N6xCN61/EUW97QNd0NHPXYmDEl5Bb4QPiW84t0krBL/QxrUDvqHigXMuaT5xC7vaQRac8qNaeVDAqGIBcTUu6+GdRAM1h6CLL0eXam9SgXbl4v+y2wfkydvYRyU67Dc81jX+UpERkWuZhSdpygO7F4blPEjkXFPn2P5bkQql0CvdGFNnXEUxjHh7jp19UhuALQvNPbdbtXUdNa9apgICjvVsNHfSnNxBb/uLx+E=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>