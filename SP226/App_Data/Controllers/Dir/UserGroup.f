<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="userinfo2" code="name" order="name" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm người sử dụng" e="Group"></title>
  <fields>
    <field name="name" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Nhóm" e="Group"></header>
      <items style="Mask"></items>
    </field>
    <field name="comment" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="user_lst">
      <header v="Ds người sử dụng" e="User List"></header>
      <items style="Lookup" controller="UserGroup" reference="ten%l" key="admin &lt;&gt; 1 and user_yn &lt;&gt; 0 and status = '1'" check="admin &lt;&gt; 1 and user_yn &lt;&gt; 0" information="name$userinfo.comment%l"/>
    </field>
    <field name="ten%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="old_user_lst" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="user_yn" type="Decimal" hidden="true" readOnly="true" clientDefault="0">
      <items style="Numeric"></items>
    </field>
    <field name="id" type="Int32" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 100, 100, 130"/>
      <item value="1100011: [name].Label, [name], [id], [user_yn]"/>
      <item value="11000-1: [comment].Label, [comment], [old_user_lst]"/>
      <item value="1100000: [user_lst].Label, [user_lst]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ipO/BdoVKVUqjz2BQsn42yn1e4Mxuz884oSjXQNqXXiJ4nktMDgv4qb/xVzVYNS7+V2OYmZneEyRNd3mJQ5QBtg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ipO/BdoVKVUqjz2BQsn42yn1e4Mxuz884oSjXQNqXXiJ4nktMDgv4qb/xVzVYNS7+V2OYmZneEyRNd3mJQ5QBtg==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5yE3oWgnls18inR3g88tder/Ca9VCtECDRg6joH8dGsIo/76E+s2jwh7aekn7ARmxnvFqdYko9xLyydPdL+X5o/UPyl04iPZGgj8ec5Ra6CMEexc06XJ390qk57HkibEAemc4rfz9oJd/fii8383+d+i6t6ARIAwQQ6Y7wXWSP3u2XOgMyjBWU3TZyiX0lZv1iZhEVtBQV5fVaC8sBFoNmr72f0fBAxBhI84Xfe+El1HH27uc3vuz1RaETRfGtkArOVMsjRYbIfFvPdeszA/VhvU+Gde99nIC5tG6UyMR1j+gMLrWCnh3XQ1H92OnWdtVSAXuNya5O5vXycRl8eZVYzGLLPL073g+zfekTEpxssSGL/fVlJqFJHU58ihzWhMvm8niNoK9iBHnnBs77zOpcpqLOxubgN7EQ/HN14Qn8A0/UDal0FuSH2IDLM8JnONz7qAa7GHvWYDG8oXcJXlUFfJiWT+TgOxiWVyP2pdbaW</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1ZdLJfs2+hgyzpf3Q6OZN5baA+2XXJikifuNZCrBhT/pBgOXb/geneKzRq4raIuIVaR/mp9hJf37QtTBF7YacWwoMgHT8LUYaXzrbxaA3bmW1rn3EWDaYJubPVUx6G9/9C7on10OpG6RGQXET3znLvkj+dF/LVuOLapn0fWdvxTtvuxnJLjvDnLbIM0CrP42mlN9AdJiWb3trkIGt9VfXz4P1j7/uUk4ZXxreirW7aA8wU=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&3fWeGq8RzWh/NTe1zazZNj7WbdWVVqRgZWY5996/Wf95oBwQAtE133bObcK4k8TS16kBaVnDW2rUOfc449b8PQOCMEBgCi05599SpvpUBNQpBKGGoVp/UWj8PhWwV77R0G/Zl2kUBVRstU8lUYy4XR78vtSe3a8dlNCR5GOpWXfJa+HXZfVfjBKQPJDfq5RAaT1RdHrbIGloYV7wylyDSRU2wVUT7Us49RCrrglBIlOB30PDtxozmCoyDbDHPP9pHP0FC4nClIvSmNQTOP4Yg1d9UBxTovDi6f2fVlNpIZuspvPcxeVtcbLWaUL0MlVKTroLTN8oT1qXeslHRS1lVyyVbPg6+v5bAy2dp9AAqFsxJ4tHQqo/xqW1T8FcXwjStoz0GFkg+s36KbcMxyMDMe2zcm43XSHX2bJBOLFhGlLLST3KeFF7Dx2VTOP3zH/UL5FXjE9O7QYoM66Ab+4pbfrgTe7kCbTQubYt8246xNzSe7O8MpWBpJv6d587SXBD8KDjxWC2MtRnemUUvnPz9nrwZx5Afx72BRQhSn5vLnpEZpGY7jjHl32AFcw7m7SUjaMBCC/7U2EfNJGmlx4Mhm6kKktOivjw6gNFg4YfPshbwUADCbXs2Y6C0yHjfRyl8LVJasprW10pjfFUe7NFYVNfGEPtQhBwGcSuThsDzk9LXrZlX9UA706FsnlVlnwYfuJ4rJG04ZQ7RdUvcf6ReXjgkZtUbrGA5lgr5qNeWxJFyBYJpNt4P9t9eDxTvrSY</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1Zd3AuTbIw87wntlWC+CvR3SHDULQ619MHGizpVvEZlh9lFpQdaj5mevDavmih84VXTNWIFsPl4D3qD2dfReOtkF4YJDnpUsEt4V7uQW+dS7tboIYBFOIQHFNSKyGtcakVPkOqSBkr3MQGIa6FThFnvCuk1fbiTobv+/NYZaVcHfmKRgk9dyl8o3sG6JnUOUuCgEEY24WipPY9nfRyH6jxfNTQFx2Tf/cogW+FVOYs+Xv96rIyBzexq3gpkCkMT99Pg</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPbv81AUPbI181RjSGH7CYHRXWJzCZzWPZPmNTrQDlT42MLDbKgENJnchU21DQYajL/SlDHLURvZwm6ZRmhrbDkcJEAWn+vXHsTMLy0kJQUBbzLUrloPSRw0AU5buRrvTT6rVUNHeyNLSiFKr6B1weO0ljx2i0CQK5E7OjwtLBTmv58C92q19CHQ5LQYVfl9Stja5f7ECS3+l7JOWCH/dHi8nmApCv4DPelSB4nUhLcYWNwU0KPu12P1Fe946fnG0KBKYrlY1zkghyqJS2ALCeVkCHXpvBVznZMTFgY5wWDQyJw9QThjzalNW61d6bdPukeWk0PZU5Z2TV2UTqrSzW+D9ajH3gXI25Gigyx4gzfAtC6xRLkbr8wq1/X/pnz3H0WA/9e4gLJ329F+h2ObEctwwzS9lOUNGOwib8cmopZDakaOJBCkxUsd/5rt1wu1Uboy/ANxBklBIpN+PTw8qKrhsAH6FHR340BlcgPvdtDfFuhxPWiVRIfZShLh/6xFE1m0pbNPpaJUvTi9YW5DbxBsR60ULVFsOKqw+tslyPHmOvo5rhY9uV6M/qeNLu6gM8Zi0Iq7Le2chjIS7SoLJ1twb1EKeimMcw11f7Ts0MXVVOppuZPN2QuXFhDq9+s+l0JKMj9ZveSiznUXtTMYbEnZZ17OMEnXn5aQ4wxa3tSGo13BbY4RBZJbzbH6oR83pVQ7MS0i5v+0nXKc3OEhk8onlyLugNgtlwjmlC19a6tQ5bLZS4+zSf0/Tdus5/6n9StN/F4f1X1dE+08rwOU/TV3E33G1QL7apY7IxhgYDkx57L1wLSAYvW2cGHoKvcr5e9Bia3tSNcK9tf44AQUCmICgca5oZuvEOsitdNkXNk6OwhaiEMubqfIdZxzVu1VfCBsGToCZZnwQVoAQ1LMJyA=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1ZdmFcYhXT5ot+aay2WOLBa0hsbey69ktNKutcG4hVHEMo=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&3fWeGq8RzWh/NTe1zazZNs8MzJGuMMbspTuoC6W5L8rPZZlIWBTUnsgNzX7p4Ge3ERm84IVHEsf79uIj3SYjWtzfkTwzK6mnK75YSUJNO/DfDb5FPZe6RJNm/FG6a/W3l4Fk5WB4VQtCZLVCTKas2ad2FkU+NuOUmetN225wKJrnAug1gywQMbOqAEXE+ffwh3jUiF5jLN3krMlgjpEKVgdKiDmyG/Z0o15ifUFUO5ibgZNE5x7hkINXQzd08sn8fcD2OGPF4z3BlHGA4DgRXy8p5VwVDf4hKoQtV3bJTfS9e9DzCRQfqMR4xQ9lViFQws6Sz988KR2eohbPD6lILjFqn8TwQ2wQGfTgsUSiR81nRaHqRvmD2gDpYXiXA0zCsKdNXrG89yAGY/tM9AlgB4P2mOSMMTISRXpshioAS1C1QmQWTlu/UEAhUrOqqHjeZ4eac4SA29/mxIUoRxSfXH+PZf20h2rnJZKGl4d62gKix/IVZitQ7U9m6NQ9zJ1OMNf7fOW2NYH+S6N4XGJPIwPA4vx/ktiqrsBiaQ1hLdxqs1ahQlgvUhpW6jtbTu6q/jhWL8o30iSFKl6npscHvdE2vPZIvyS1P+B69dQJ8v8kVCR3Tc+qUKy3C4cVdQ6jlPnz6FxklYUTu9n2nHU8gRWpinTh3ePh57hecvduyEHV5lySeENzM+WQojV5f05VJ2YgB26IQcS1Btfve3F/PHhxeieH8TH7XMHq7PW+HnTwU9fPzohyOSoINN8hEikQmASg1RYYX/lv2L08QgyEzEnAYz2eIDUcvNjbMSn6LNknsYCbFdpgGr45k/VFN6ahFbZ/tKManNoWKf2gGWDyGh6i40OWPq4xzo/PuDMmpPaOLD1JZnNaruRMHBtNLc/CbObGLh/Pf9bumiYHOAR8AA==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAntCGM2aaUkiTAcABGLpJBWaXAtg5lBzTiS2ahA7h6qFN0QuxQako/5LfFEvd7rPegFIKcN2Qw7yo/jY875BOQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVwqYUY6jECd65WlBYJMeQNwj1K4KKUDtYBxpI4U4SDdDdpM+rIFJENX+6KIoUngyNBFNeEHYvkRVEY3Ro7Fo0OF9UvrAKf0+IdAECe34Z5hLh3a00qCgTmZdz3hT+xPE7ShOdL4HVEgF5101rsTQRg=</Encrypted>]]>
      &ScriptIrregular;
      &OutlineEntry;
    </text>
  </script>

</dir>