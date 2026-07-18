<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Controller "RequireFieldsDeclaration">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
]>

<dir table="dmbbnct" code="stt_rec" order="stt_rec" name="cookie" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo ràng buộc các trường" e="Validation Field Declaration"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="status = '1' and ma_ct in(select ma_ct from dmtktct where status = 1)" check="ma_ct in(select ma_ct from dmtktct where status = 1)" information="ma_ct$dmct.ten_ct%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHSTtJmtRFICJtM5zq58R4f4iP6WnWzzDIgPxcBcyqGhdQAUnQSADm8XjoqLR7/DPPXqYLS9vI7Dny3jvYTABcrg=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <items style="AutoComplete" controller="VoucherType" reference="ten_loai%l" key="ma_ct = '{$%c[ma_ct]}' and ma_ct in (select distinct ma_ct from dmtktct where voucher_type_yn = 1) and status = '1'" check="ma_ct = '{$%c[ma_ct]}' and ma_ct in (select distinct ma_ct from dmtktct where voucher_type_yn = 1)" information="loai_ct$dmloaict.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ctdmbbnct" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="290" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Ràng buộc nhập" e="Required Field"></label >
      <items style="Grid" controller="&Controller;Detail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>


    <field name="ctdmbbnkt" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="290" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Kiểm tra" e="Check"></label >
      <items style="Grid" controller="&Controller;Check" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>


    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="controller" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="350">
      <item value="120, 30, 70, 180, 20, 130, 203, 0"/>
      <item value="11010001: [ma_ct].Label, [ma_ct], [ten_ct%l], [cookie]"/>
      <item value="11010001: [loai_ct].Label, [loai_ct], [ten_loai%l], [controller]"/>
      <item value="1: [ctdmbbnct]"/>
      <item value="1: [ctdmbbnkt]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Required Field"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Kiểm tra" e="Check"/>
        </category>
        <category index="-1" columns="120, 30, 70, 180, 20, 130, 203, 0" anchor="4">
          <header v="" e=""/>
        </category>
      </categories>

    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdo8Jbwq2fQk6THKFKkbR/maEchPbHyg7rrIXV4UKwtRI78L/Qnc0yPGtnYaD0CQ0SEcAM3Snm4pb8v7vPPzMhvuqK5qnc8pBlgtB3GPnR7Y1sXECEP3Rm0r53WTQI6v1o38xty7Ujp+YmznTG7jiIc5n9obDDZbRJpgbnpf3knlQTZLo7B3WPR6mKZ/5LAfcYXKFaYkKSJpbVddPckKp2t4=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMjEitWCiBAWcopg6nypxirG22kVK4Mqm3+MnWVjVq0Q</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdqmn275oJpJ4vjI6yXBNmt53HOUPRQXzfP97G9ooeGa4nGskGaQ4Gsq9owho27NGQw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdqmn275oJpJ4vjI6yXBNmt53HOUPRQXzfP97G9ooeGa4nGskGaQ4Gsq9owho27NGQw==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIMVqCbREem4GK+WVYUfonT4ztDxTtoFjTqXd52Vm3JpSC/RBaMuKLX9LPpn+V4rtWZYRYGahRohWumu02FyPIf+YKyAvEkD3QbAdfDC87VOpySPkjcIrHTzuQfwhV3IG33hWmENJNwKWi4fb42I0im8xwE6/Vhnqo54q6PkL4qWTKP7WqTE1JrKPoIXb0Lg74Rl+8f4/gARzdL9ThGqMoYaGoinm8TKYe1j6Ek50m2bTttevhL5XrqtNfScaGaU3Q5HadECEAWIyjCPAoOtQRYmxw2TO85kxs2ehD3rNolFsXESvIMeBjkIz3DXW4XFevdk1Ph7aiN7cTj+WaC5qF7AEfKicAS8ssvoF5j9STZa4mLEUh8eNy14vhPei2udHcDs1/BDe0lOj7Zg2PYyUunfjfw2c3IeFLjQTR/nUxrMyoyLBpYevh5FC5vIRKCyut</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w/7ygKtL/Z7gTMS+0r+fw2QWcTrk/PslGa5qASPYGSZ/T0Xu2ckISj/JiFdbMKttq78av/CMONvrsjWxygNhfTRInd10wGXYyF3BX4KzgHZybYP2FzhqhLo0O5L3TJ3XieaQoVJ/hJEF1r5Kg7wuTAvONBOPnO+/cdfg2z5c73+lkpVMGrLt+nO497EXeyd1mOYT9IzJwKaS3Bu6G54RxDk5NPd2M0LjvZQQA84QXWxq0sKdMPJRYIIaIhKZml3NGhnlIpzuPkTSoXqUuVK6aRM0aPlF7/omPa1vbipePGnTA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CeLDrYfDiZdZAQd9uBs3IsZQiFNI7kmESCgP3pn0v+g9PwRcGuY/gfm7i21lfqEQ4bdfU/bwuu5t1OxytGJvsAPqHqYE8fp3w5lJZu2bl7ijtldu9Gi60ozwA2srF0xXIO8ui6uz+gRHM6mz1vL1N6XcgyN/YA5q1/v4y5tw5gtWrMYaBSAEu4TZOB0c4S3Hdd1hIaIElGKnNtdvoMPYFVrb0vc3ZCl5Noht6DbMueECVXFCuu/kVJfN+aPpaLhlUxzIxoPCOHG3/Gd3tvwSB/W48QtnwO/H5Zd1ht8Ck1YF7rIQ539tdhV1ESFG/tw37ScN3SWONCzuELKUQBqTuc/Wcpkd8THoK5m1ZfU2E51uHjNVLfvWNeJZ6n668QELZAolj8/WfW+RGh575nVWruQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMVgYLZApYxKOspOW9Rire47FAmha7lp9eE1gxcsnGPKnOq/uvFVA9oox37u8I6d8WBr0/nR6pPojY7z9GFmHJn7iBctkBVqKbVMMHUqKZoWyU88Ia2qR/i3aVSNHXLERau1N4wYxJdRmu0PnvH0k0VpH1uaLNGrBkvOcTy/1CXq9r3mtyQoI1ybcybZPiLfFnutnCWsq0SuLp22yNDyrdU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6NhTXFnc6D0OocQP+WQkXvsgd06P+JshiD+DtEUDfyhpcj6bdaxjoT4cEzC8aJUgBG8vJUxWC0zN5/HVJArDmRhDbUCaiNBocgBpxFJJ4ateg1sONLfhAXO+Q3H3jEG4XPG3qNL4yB0HWFIgdSXVRzvpnUaamFH4Q08HIz4cUP9lFtVr7M/0v1EZi3MqdtnUGrnQ7kJ1Y/b67/iKRraq27TPTE5+LpRiob2LVN17PHf86oJmLE9XrPsuHU52R9RPFHAyFxvxDErQ/P1PymNWBKJaRW5S8Tc6BgLgp3v5DD8nY9qIi6GGU6Tey00auMkQAxbP+kgX13YG/s/rBjRCBrQiGvTbnp2fXOpEezzeZ6KUbJVs6ZFjTHCwjDz0BI4diLKuIpMAzVpj6Ruae/QRAYCu5EYcyHLELUVTC1t8DrpudNqx88WgLS99/qmImFVFaF1qaV2NhE4y4ekVyP4O+ppW1uA+2uKrvPLjCBPxQ0W</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22e0H+vlwZy3F6A3DfoyqZNyIlb/Os+a6ykialBiscfCjnGjf0RiXpQ/KyZZ/g3LbVEUVtPOToXsNuIAaTvV3soGlgTCS4Jv2WaT7aFja7DKAXuCwZuz+ayGhWkcuOsV9BQxz+wDri1tV33KYz5VxGEkL8PJhWc1gbvZPF5wsBtt3w5G2rY8ZStnzUJc1qyrO6pnJlNzW7gtJlwDjd9suGz+buFCwlUL/3pkjZNKYzG0oJDn+2ubtnIHA1uR2OikVlJ5W+xzYeZol/cCHEk4R11CrkPLSDosIjRQ1wgCDdZ4GFSrKSX/CEsgKzYhs0QivaTYtLOEdkoUxnVSeS3Z7FTiQRrElgss+/Hyl6PUx0vgHbDf11HaCh3139jXQH8aoimM7Ukr26dGHGS01r7CwBUU=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3VzFKCSFGTecrXirqW8CTOLV6z0yUW+bDktoC670Z6/iurMzo+7dQq05sH+yAXRorXeqrnlgKm2jor8A8gDl0Ry+2exK8RQffPdH0vtiOVy5cugFMC5GHEi7yoUCIGx/Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQmB/5hFHUuEbs6gRh7wuGI60zAmnrviG1D2+rVj2tNTMiI6dF4/Q9oeE8cefULxzh9wHNoMu8u8MW3vqaAzRgxgskAYhuD/Q5YegY0+WGsRPozAwis65BFRRUuYxo383c=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzskRvxte59Pl1dW6ZrMMlT9t5CKKVyF7YLh2DcymreuNeM5PDCX2LRbXDGGKxCUmCs6SF0Xty9sUOro+AGpjoucCgw+e6ihEpVp92IiEmWVKWahVQuSxZR34wJu423eltQrQBW6wNPCCK1H4V0IO9PcCp+DAoaWM1qaP/ppiHkh3NyupKGLMBtBg3n9Mu1EsvQA9yzwbgXJKa/vGGr3TDXE/9du0jLl7xdvP2vg6GdSK+/MBtXQiIMdflg4lhAayHNR123peppaSQFjhDCKJ7Qksn07Q+7hGPZHigpe+fRrTSYYXo5Y/HiQWDZJDMpu1+T4pbXpiq+s1CRdjWK1orW2CZSKnuid/OnvZ27BnADt7Gz3x1zQRPjwS79ubxlxS39G9HHx+5V+O721UPhEIyvrSLqea5kVRrPUGIanBILhRD2vGU8g9xkPtPxrJygTdAgp415Ml26f+KtxSi9ps273UBHZFeVkBAu3nb2YQB7f3uAzex/zh+46TWUmh1nP3U6OUWQZQxIuQSi1J6pZ7oukTrat2TNXICN5eg9HCcrstHNOkhZ0hS70wVaulzMNEVx/YAh2EhqIflaWIOPGnhTS1atAVrxfPMjrQB7UES5GiVJ0A4DeTqDJybUCcl2tjU9Y/HRzpI2JEIOvHxyHTydLvfaatkaiC4+U5XaQVTAvP/SqGynsyyyMxlQiMO6Vl7eMtb5PzE712oR7MwYKgd25uZzBHrpJRQhYWApHs87MrvHRCmC3mvBsIMJWgLXSII4DqnZdU3pVqW6jkZEzNGjRAokalHEUjHnM/mDxBcYlXeeMpE/UzuVjnkYo//7M0p7RY2WUBMex1eNYhxrpqJlThwnz3oReSTyawayyiJEEt2vPn1FAGdeqhsdQVrdKJQDz8I4H/oepladZPSgSBPzwMVQIMYLS7SWc8EnVum2NUkgFnOGwFnoSXydeAd8NwQWc+dHFQVXO3km+cqK1LAz</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdiZTNAr0GPqivv1meyNDqACuf8g09f/u8o0bAGeKeEo+3nYbrJT9unrU21TP6+An5Q==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdrQpE+ldSVHwLzSMuWNAAKrn2+jdOoII0hUBDRONkUMY0zf1MLma1oqLHSxbKHD0VNxEnXuwGL3oiolIcAJD2w0=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdssGWCaTJD1tyOh/sqOvIDy8hd0wVpU1SXV3jOQBvt9V25r7pqnFa0+m4Xl7klNzN4Rji/1+h45KOujv67CW2OHzbsrR66fnEgKejiuxm0oYqvwVmwAziSdiMv7Bs5p09NNFHuemVvwuB5vXJcWTSOO</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdgelmwc9ipSpBcxcoSMGeKE/0QnX8JjCMUW7fzwOFJ4+Qro1TEbMVv9Zdt6JT/u+5z8dvQegqIDZoIZXbEwEoQR60AScZRza9CNwffl874WzCPWBEGB0KnhH+sRcIIvTVg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdktjU4epwafaW67+13Gdj+xgSMeq8sPZSC8kLabOG7tHSO2KpwJONQPFrEsKTE9PrOPKYNWkoSNSIkVWAM8KP3U=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdrQpE+ldSVHwLzSMuWNAAKo3v+E4hRortekDPKQydNNmUaoQMNUmWAVLflDj0nZ8uyhDoPBM7K/7VEWBOsvZWdWqcpuFtpuPUprXOhktq80s</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmNJdsB6OMvyGDRDslybEqOXDZCjhJ3pcmWT1Qo+UfslCGblos/a2YNYmPt8L+LHTzY=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdrQpE+ldSVHwLzSMuWNAAKoYlLk8sujKrFS0zvehuCqqPa7XVEGM9OswUgoRlF5RmnrXZRqC/o9XGg1c6GO23Fs9XFfUbrNWAXEt93/e0xYdQmeUHgYSipxyotz8nHO3eGOVhlMh4SO4kChcCaKK7/QeRRZ1gsrocNFvRiVAmZgoOyme6z6kN6Q+yD32xC3JtbGqWbeGQ5AN/3LM0bco+fNMfsoVqeKiUqKpJduiBjy0fFxq0RyIamAv4zi/Ou4BbUQqmiNTPcklqZ5/Vx/Afnz+2rONW5VQJxXUX+5NZLkuUN0pXxg+6ymCWF02DJUQgeyvda15sAZcEGkD5wdeeGIE/UvzGssl54jKR57Ioe+j</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHSTtJmtRFICJtM5zq58R4f6MAKAOJ9WmZDyRMG/qGfQzX1He0tWimo/eUtne4bhftXYiPn9r8o1AETzzpfFnDq0qXz4Fy17R1Ti8poOkQwUruHSBgT6kVxTkqWTDkh9QT83a4CkhOssrrCZntD2eZqoIfxDMzgwRmgFlQvYSA4fDs5Dy8b0ZhHqPIsO84NC7fi+DzinJ7IGwWVJhY54/gM008ILqCbigb78A/+GmAOvZDBUzwm0C40Yz3nGEeBM0wlYN+U4LIp03lD1648cushI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k80afzxEVEXU1r0xuLT7L0LO+rYrCS5UPZDsQ9TVI7deb3LlCQ7vN+KlIbGdGQDh2BXPgMWYdHYBr26BphUcRbu4RwA/1s+tZryM2M0kVQVyBvHV5irfXEswS6IJjMrjahxX6+DzdeeZTSsJzJWMkC1E/OG1LaZsdAn20XyuDXNwCISp6+eh5MfNwrLxg2RHfJpwGJGVPmJhuzNh6LYbJ8DBazefbtWkteZYJEmDLKOoDFYCFY2szjP69HSkCy19xMU/AAp24mEc0zcfNltCX648EPkmbr/ztO6n6XGTb9oJshPkqT50q/fT6lsQ0NbOi2sf3WPO0wIamsFukbO6aUQmkdlVnf+fcEyKBgThhFH2Lh3bf9p+zzwONf+fiA0qfyVkoyvDpAlJKM8Wj365fnLM04oYk8SyqShE/NPEcZf6Fr8Jn4RQBgZe2EsVwdUnc6GKTiKQlVr9JDSit6xcAuSAbm1v0jNG3oWsG26IkqWUsSHgYpCJ5luqrNkApLbq4Hl6wWMm/OWHNDLxwvxqBMhESzs4wDKtHJifUU+hS3J3bPTuNwsHTmLOx7CXRXtieXAHMmOispB/7koHLKImJQhXJB3XSoPFxhjSaz0UuchkPDrTzbcEZvoB07E1L7+UbeD2BJ2VvhBfnodlAUOqeCOQyOewhLg4dXnj8vwV63osJzJ9DUlHF+80bkPkFvbMast3sJDu/TWpcv4xozFBYXMbtCIuWGRoFxuG4MjbwUIp</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="VoucherCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCCvUeh8oRF4cKdXZqR1sVg6RvduwzEHmRlIajTo1iiVYp+upNEPJ9MhN8bTXqG3zrs8CfI7EZ0lqE/eUL3KmffPoSaGXq+jHPIgA8UDmUCFWqb7GKeJlb245I4dvau694oP6wQjREUWkay3rJf/PIM=</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>