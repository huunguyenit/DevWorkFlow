<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SARequisition">
  <!ENTITY c11 "Phiếu nhu cầu từ ngày">
  <!ENTITY c12 "Date from">
  <!ENTITY c21 "Số phiếu nhu cầu">
  <!ENTITY c22 "Requisition Number">
  <!ENTITY ext "91">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SARequisitionFilter', 'Filter', 'SATran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m91$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhu cầu" e="Select Requisition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="&c21;" e="&c22;"></header>
      <items style="AutoComplete" controller="&Identity;Lookup" reference="stt_rec_ct"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ImDZagNihz57ml8yiZEUOKU/jxd41VTkSPefdhbKq43</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&zUpOjW5SsWLifX9NoDzKggjiSpEFFYANAyFA4W/5PLvRiRqR9eUUa84I+QmyuZhF</Encrypted>]]></clientScript>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="&c21;" e="&c22;"></header>
    </field>

    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="SAItemLookup" reference="ten_vt%l" normal="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ImDZagNihz57ml8yiZEUOKU/jxd41VTkSPefdhbKq43</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILh0D4fN69hBraNPY/FNHlhcyRHWmL6ucJT7/SIlAicfn</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
    </view>
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+WzIv1LIniksQQUAPFwtU4t0z/MI2GuG3Ij1T08Nxqk40gCzF5RThWsh92Woeb9PILXkGBJCp67Kk0itgFwRV58wYLxKrQq47RaXlREFt+wsrpbBUxmj8pkhZgbLRA0oVq0U+RAmB6l0R4Y4IiXPM44IEvBA9h8rhg780KLGhz7h5xpY+bS2Kq2lj+0oo+/uEk8McZ9X+hiRraIk5gP1ctavDtnzfD+RhJ3yStiLbVp1pCXFrDQJ0xPsKP0OOaTsFc5JzM4tXqhfU758zxNuwIyeNGupqgDysX48iYB5s0o/MEBfXgxW8VjaH/U8eDkpzzCmGx/iVUcp483bNI4QavIEYA0fSF5+T3YP/I+BopgjxwC4GURLTAFmDGHAYHWm4lNKEcR4oYlhnQlmVmNORsFqti+tMLVTiwrinVPlO/GTT9kBjEkVhQjLZAVTU1TGi28AxWqf8L7F10I1LAoh7Si4HYmjOyid6ENfTYpMzMrbx5LdsqFwFi/3Cfo01OUkvyKqnIJOG9vrn+u1zLlfKLC3aVgPgSuUBBH4MRze8pY</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ZJWkQTiRfLMLpCbGK7zMm7Nm1ASJQIrlqRdbtUUlv0nT3abhXo7WTvQceCbMo1vqXntPlcyf7JheNUQy4mwVDSXZAS7+KksEO4j0DqD6YJWg5MaI2v0c6XEg5eMOwhZ7BD76x+712u4Ugm8eb27VlT7ePScm9oEAWLUMBcW0Ffumz3FIrLIW/VM56dFNjXZShqHJ96Pdf7cYHQ9rus9hbOiOFB+BpqarQnuzMshdF2gEsjmCuOzWZF8n14FPUog0iO/k56OYhkZqZ2pR6ZdLxWLkte0/FfwpO7SvAZ6v6DHTjjgoHAVXV6YM5g69dXeqvxnW3T9csIVU/tAbuq+lkMk4s8kvvuQGktLWnPPilveXgepWkK1nwbOQlTqUwY24N218iaNy9Ps8Te2W0EeMd23fs+MOSqrXTfdtDlFS4ICcdjl5bpofMnj70XE9zpMAnzcttCLRkzBeqEVqZiMoR//tYDyEyUjoQm8dt3g1bSvX8RLMRSuqsd7MiiT462Szhl+BIMijNwlAkfku/U17234Qqd64Ab/zTDupU2alLubRlW490ChDLX35cWT9MuCrWlqW2Z7cOblbJwwMRFZ1xAh1yE2Qm/Of2X08OuBI5xYtaQEjDqxczduFMdIcsQsjiIi20aVw+KXzejrrhicfJ2R895umNWSRNAbISX1RUlN8g41IMNczNZ3DL3F4hvUzpizPXFzMM9dKqMwwbngknQUIl9JGJtY/umgs4LPvZPweUBPt9EFIIA8XfxJrxVSp+IJ009pWWZ81D3WAi0IzF4vM7U3UUnau5YKvIA61MTwidVtANHEfTYK3Lvlyb8kyWtNZ8zeRQwbp/uHo19Nrk4UhBeTj4bnxoNMYCd1a2nq/obgFgbLtezqA3TYnb8meaNQAFhrOagRa36D7g15lYjlfuxbEPy7RTHeD5c4uR395JB5OERuZeo5OOHT9wQcKt/U1dJGyp+LYK772y+mD7pgRvSf8VfAb6auftt4b4lu/htFGyaz8rxaqfIfEryCi2MzM5VVi7gn4J1NloluQHBWxoqUk860MuAy5G6sJS0rGKjy+mwG0UtxDP09eH1WWQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIFuWhFfGwAduO+uG+CZheu87+lNaNV4+bBfcZh4+st7RLbD2K3TFuYjIwEGWN7oxLcrxjsrl8sR3jGNG/t0+GDpgtRYutjcPb4hl4Vzop9zxkCj3h+qazWNn+TIOs9qRCmAOjaQxaiF7vi25f9hpXid0Zv1TwXc4kOn4f7oWQyT1oBo5YK68/hY8xHeU0i534=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&lFnWC5pWEighw0rbVjnRQ1evdxDGgilb+N1RFgzEp/Orll6D474/vWzgMcofWj7zBotq1piu6cHNumGwAKywHQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y4EU2SPXkeckR57ev/3fOqolxaj+TpllM+gn1hZztow4nEaXTPvYIKGvlym5QYlDiuv1BM32VlpVtSfHLAuKEkpQOarBQNCn51rIVGy0GjJRmq7wvH48yAdrlIFwCO56Fw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLl9m+OtL8i92cB72owkHtKglehpWqFjjGh1JgyPmUDsUJytGGE2CIjlSRInliAnu0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLPQY6sOKUh3+lm4HRqMbc6iBZlRMRh58G5yfBppX+WznQHgsY6hBrbXq+hgEp9Ui4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nZOmGVXgdJYHv+lIIi25u2AX16iXFEVuBNLd4KfiqiP1Iy/27af3U6BCnCJpWpFZocXgXosVo9GY+1qNlRMzQKBwB33bVV9gMPZoVEElkBp6unB7cwGGZZid1aEp3VUUvFUQMzROivvNh1xt25NV6gpsIOQbHmHzTZZa2TLh8BWyd5HA/YTP9x3CHDmadQSHcnsRrZ8vrYbQdyWm4bq9zuDbKXz/Xa+yuqBxSYW5A8UjJDUBiaSzl+xFqV83sMtx7ow1FUiOkX8AyQ9uYashHVhEkm/K51cpKEJaHzxtDg1J5IaFnpmNwjIfZpk+o3P7v4j+3+ev6un5wKN9P13xBRrQU3AGgGUrLgCs4OX9EpSpXKa5xD1/eTruByPvanugXNB4HhuyKbatlKkuAWQPZpkt5cr8abp2jPEmV+Qb25aqCRdQW4TOTj9HO46BTthBw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3n7fMSXuy2bYhtxguM4Jm5n62gYYTNIg+qJrIrhNlPakMTmbigJa8ASHKK/Wc09sImfbMtXcIQUCcEib0xBYLcJGkd3TAxwbvd0CLm+ohPzGQwNNNjPh3iLH8tN9jVyy7Q==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWL6iONrLAr/D7NaWeOsEetDQSyT7vuKZjFSu5T2aKBm5Byxma3vBmEemR1mIZ7oQ+xIx7Kn8IFEesWGFLXH06Li</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWIYW2DlpDXYLpIa/fRO7wn5M4fP3r3QsiLz6rPXUw04JKK76LSdTME5LpwJ0/gdoIkI2Wu30AClghKKpEEFBDf0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWIb84M3GEVKkYuWqHSdirjdz79cMCClp8r4E8NdxWTkM8Hyr8fqOjhODhNxWh3mBqB8nZtA9fD1VSFgFlfQkvsL+/3S3xwhtbtRFO2Ukbid8dr6kcajg0/cWaHm1T67rv6EcqJPCYSS5b2AVJP/mAWTvvH9MWl4zFf5zPyz9WIdLSDZr4320oJJi3rv/8uxP65RwVoqq1dvv7tkJC75c2ePxjOPxjKNd0uxOkAn1arGA3KkUJe1fSPmW3ZJ9kTBvXc5VifY8feUH0ywaW3Yi7al8b4a1HNesHTN8Km6AhQbQsXDn5PgshK4LiArtWv8DJ+EaQfeeqLln4aYZCBgRH5ym7kFgz7itnWAZNtQFOwSHM+VSXKdt1G6K7/10tPHDAc=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLChMb13BywvhDJgwnyhUSyeVSj5UXWTwB3R06jYh2QJvz/vMArRFL8Idz2JcqelyOFv/Gm+bY/RXban998C8gRZVT+Cy7OgaXsnQ0rVI/gZ5i/XQOvOHumqXBTcdAe4Uwgge5AFLrKuN9LGzJL4U8BzjVVmkRt/AoJfkmnmuhXBriFc+1A7on4KI7gM5BtgHWrs0V95pBCun1kVL5HfvpAyhmZpOsfAXqUHreuPorJBjShW7NHTfsBmp2e1suRjE9kW79uY5jC0kBj/PqkHHF9RWQpsRuMO3xMjWrd6Iump9fP7zt9vnLQNStc3nv+duBd7EHNrTkCPmCBd3fc+78G2Mw/pJrB2Ifdc+mczIRsPga68ypickT66vuy6O/3F5C8BaLwVYvQoq6/Oc+mu2kVVUXfDO4DSkpukvu2fVPXIEHYK36N6E6deNnbprouoVVuKClDbFJLdcnNFWMhmrc+0sGzMUyhqD7ageezaRm/7g==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrKMYCHssObkBLe1+DexzOpeOCtdxo47E7U2ICXviAYvAl98njS48ER+O/55Y4oRSs/sIYGHYoV1Zbu1mV8PwNqZPWVl1EuRy57n64FMX4eqiS2aGzSSq7MIsappJE/kkdJNU/T8MbXXQswIA1+HgV4VFFL5MK+EYqHsZIdSnXvt81NfKQAPE9MvyYeqlkicoCRSRNfw2dUWNNk57HRD0O9a</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaH/CtUuLy/hvt3u8Bvftrye0XvNf0rLnyjPSKspRBurHg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sVpitp0+hFILyKfrnwQpCmVQKG08UnmtL+roi6QO9FKOA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/ymZ9l54qC/L2yU4fowjEL+m2H5MkO2u/mtbpLcJ2sh7b3B7S+CQCoDe5TVZN3Ca9Vp0GZ6bFockD5PkqdJGsFs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILnUMaN2EddLpDZgRW1bu9LVq+jo9dGFWxf4q0PdhJs0mh8GVCC04eSidTKhIngSjtfOs89Fg7Ga22Pcp5+lteFfrRUYUiswWAUdCxqZ8raR8nETQDhU6GKpKzOLq0vfpNKIz8j2BTYho3IGMHLWiiRUm7nq8PkCBKct8QtCwUayfvpS3AeU3CvQCUnqbPUy7QQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&zUpOjW5SsWLifX9NoDzKgpWnCQoA8cF8iumdsS/fEF20g/dIGs1BS64w4aEfer7OyLYHWv9IBM+PmCXG6hg8tGxQfdRveBT52pxIO4BqzOzBCb0yp+jq0273YMshPM2PQ+i4rgjvPojSxN/3ExUankoQcgzM5ssrpQR3AdQeBjvcdz0KHj56r51F5X9MfJaX</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nZOmGVXgdJYHv+lIIi25u3GezSoXwqXWt1jhBCShMxutJiDW6XOyYXcVDijtk3xMrc4xTxOV2XX9ewWTmvM88Y4aGF2Ius3fctN0OZZYKtIYs1HNyiJcpJatIYHqZKep9ZrrxcG6HV99Gy6jC1KNAZIP43Ra4m3kQCCbOLNAPR1uV9KPkFD8nOIwBy7Rd4x3GPFmSRjaUVi0YdDyX5FFTkCpECLyItOAJizIeBV0SvUMiEQfullFBdSHd+OqMGkhShPOE2dcoMS2UmvZXkTfTazJcL2GLTBXou/tcJFlF02AyLHkQgeGR65KXMk41LwTmju6GQ9dfV+Izx7m+P3syP0IKtB2JrtkVxKZAWFqNSGkAVvzFQA3WT/wNnMzt5T5w==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="VoucherNumber">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+WzIv1LIniksQQUAPFwtU4VuXhBPvmys+UwyGtPM0o4HDtEjIWZJSpNgbsP27g6xwlCR8uR1f+sOluXWZVcg0fd2wJ4Js55+mG/+eekiDr5uv4qx2hYdXK4BEFgyY+Ad+yMe+cDeW1XtCvHk7U6jCQENdXWFNdSr2NSW0TGviHJ3PTEPnIDXBu1+3EIdsdXya0dmlXHN5zZI11bh4nmQ7rnGl/AnLXGPKnCs5uZH+FzZ6KtQe9HEWiMdcO9F41x6tWt81cOXii/3aWVjAbc+G74ydOzSMn8bPU0PEq0PKzKJKFWbxmLFEiCFA5kC52iTFT32YGOzd8j2rGE/BnfuLzot8LtOp2Esp0pbyOYDRL0qXO0kNp1MI40dcxWu8iFp43wGckXqpPNBErwCJjG9keJi1dCLozR15AYg1+nBF1N</Encrypted>]]>
      </text>
    </action>

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3A2uKnkee/ODFMGCqnVc30H1xRvqFbxXZg7AaTsQNHIyX56WeLqhxJCpmreNFWqunJi6HkEqrEoB+2S2l0FHfhZGGMvxrnycbIj66xSHnyrXzxTM9rp8u0iDrdy7xcICaOZxRWPEZPO/DSUPIkX4xA6B3klBDGbyYxE51xtO2UUNoEVRarBZ1HfuAsFSKJAgkayTWpwhKNLQWSrphpogmYKPOmxFhECJrfSbhhl1m/uaqrJegbFiGqaz1kq/xwxf3TVyz4lmOhiSeUQmrbAN2Gymrhp4jXTGnqsdY1UTVDUWHsWVEzNHeLq4uZat0fzMz/8a3CXr6N0yJtYjOpXmcLG+yOEtwO8ivj1Vk8MZaaeKeKf3Qzz3pKCLGuu2rCYP7765x2nyGGDbApH0iLvI1/6muQA4LPRhj21Zm03wM/nhoXtdNV6NaH5Lm2N+IdfWp5F3/rbbeS7iDP7aW8pP+4=</Encrypted>]]>
      </text>
    </action>
  </response>

  &ScriptFlowFilterCss;
</dir>