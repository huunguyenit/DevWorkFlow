<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "POAllocated">
  <!ENTITY c11 "Phiếu nhu cầu từ ngày">
  <!ENTITY c12 "Date From">
  <!ENTITY c21 "Số phiếu nhu cầu">
  <!ENTITY c22 "Allocated Number">
  <!ENTITY ext "93">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'POAllocatedFilter', 'Filter', 'POTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return">
]>

<dir table="m95$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhu cầu" e="Supplier Allocation"></title>
  <fields>
    &FlowMultiFilterFields;
  </fields>

  <views>
    &XMLFlowFilterViews;
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJyqLg40MCp+Irp3G3dWyjPZ33oasD1+43GaD1WvxtVXb3GwSqcaITje0aanKYs6le1TfHvdMfH43zbEKXw6pbvdyLE3w8yESEsVSzlMrVWPs5RyChZv5QREeiqKFEt/sQNBhLP83/pcyQ6oGjjc8TVpqWIju8JW4ZEYfFongtGIHqHfi6OFaoRK1ViymktuhwNtw20gzrqyxw/WiAGlgWDQqO8OcljeOEcLTedzR4KjNPdpWTJuI7grESxeidpZTHeaSrfwHnteGqRq2ozgD7iKDuyBtOA6X8Og1to+CV5WZxlrR9grUx/xyMeydJSlchGqdYAkQ/NaIgJITWRmHP2/NVT4NKWEdkQHXgr4jo2PzYgHkWVa7voZaShhm3pNkCKZM2qHCF3OFdot39M9Tng==</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XQTUsrOWCvf0uWukGeXgEnKRSqdGA4CP2nH3H7xZYKCIZ+ncaX5C0pVxJWEyQnOE19q0paMFcvDnSDCKR8+w9BUFcmP8XnGMODPFwEsha1QYg6mo5VJQ4Yzl4wacD/wWPhYHrqA9R3j5EjuY7ztMoMbd64Q2HVmx0ORlMNfd6d04DdLCs6ljmIXmwo29o96GssY9lXdbbQ5Lon/+WrWcBFQpF6Rexuh2z8Lp9IKEkcSwrAZ25Hki3KFNPaVG5tar589se9VyH9/5qtpznB0OmzElzgjWQqDMymq9dH80CZwnHWdLQuUJrKNvXVhFIF5uNlS0OxxnWlDcn4JuTwJj4NgcJYUw6AF26e3TQ+PuBgRqvYN7rsXwq4Y3DS1yLOmyOy2r8MgAXyg8wNVaV7ePrxDMUMa5w1P/0jX7iCEu9LtSurv+v9qyVNUefCnoWTPhbDHMAyJaGHWQ2/QeAJKvwfquhJOUu9MRcLaBDtfLALn</Encrypted>]]>&ext;<![CDATA[<Encrypted>&LTpabyia7LjFJgPs/FV63pYxVSo+esNP5/89hrpM8b3zEO/uejvfiHa2s6N9c6ONQTHF7ojIZTWZwbABaIfzCHJWqGUEgKz3z51JWr5OxAyyRGSHiX445/UkhOvT8fKcTnyPlWcLem96UhpNxj0UAA==</Encrypted>]]>&ext;<![CDATA[<Encrypted>&6+Hrj6TYQzyJr8/RW5Hbval9nNCs4mEypUxYyFnQqE6EqHo+1Icm7LFzQVz14/T6it1qhv02dIgLcZ/Ql6SvrpCtZLXuSnnnXJAvER7QdGsXrVZHuZ66paU/LPmpfXkw980gRFto1ZuMqrHO0R09UdBkqG70hM0zaUlqnk5xUV/8JrwzMRdF+APHvfLQEy4/Cn2CcZxkLkIfa66JweRqnIuihOQJuFso493OUj8dlFeFVPU0Yoa0SgF3Mu+oDZF/m8pXqlsjA2b6xNmXrTah14NXd9MC8yAqD00ldMYb5pfU+pv/owaTNDxDlbDIqO7MfsiUMlrY/2CCKWlL796ZE3q7xodNamlUheVaqBDAzRx8yuFPJEKy8WpuLQoMkPS8ABtG7EMNLyAEDGNneag7HWkfnbiWecKPU5pg6oYZKYVqHzkrMJjCPC/f6IT/qIl3+XxwLzMnQfPvhnnF6tmb65LQYV3oellLCkIe5Ke7d0mFU3Df2vYiWqGtMEIbFL2jduAdcN5mbZdtEoZ6CJ9p4sxd3r7koS+k6QJfWGdJy/I4gVPdm9gCiRkYADq3Zvh8o4h/m5FeTqryRiSfBJ2kXDpAWIZBlXSdW5XouJTHcEkgXVa0BBGSJ5Bn3pZHBkEin7KuNU39vcCEuCfVcz4OuMUDPVdJKPGKLYTUu2X/ajo=</Encrypted>]]>&ext;<![CDATA[<Encrypted>&LTpabyia7LjFJgPs/FV63rYgY1iPHETCu9oRqERvZOwgtKDPqL6sLLq/9v/kulxcF03LEAhMDUNNS8E9JjQGELrvROClyftTYDQODztRSXGbr4Q+CjPRDi3IXE5rW4d1vqt2+KU1boGGva5kNKDbag==</Encrypted>]]>&ext;<![CDATA[<Encrypted>&LTpabyia7LjFJgPs/FV63tHxdXkr4rMkPnqFn5o1gtB4aajk8rM/8ynDHhH/JaCz</Encrypted>]]>&ext;<![CDATA[<Encrypted>&6+Hrj6TYQzyJr8/RW5HbvfATxXo71iowrUbNeMM+VFnt8PZn7yvK8J5XqQ5u2iyXdB8hdnYFWcAAK4/tZr42uzbHb8TQFkAp8QavgcEgd3c=</Encrypted>]]>&ext;<![CDATA[<Encrypted>&LTpabyia7LjFJgPs/FV63rYgY1iPHETCu9oRqERvZOztWtFsMOThydN33KnA7wThavcXP5TTyIIT06DX5kfmurpiBDlwAT9bkI9mEvTlB1FyixEzXqbw/KYFULu4qukjhZSVPFcloAUrkyQUiGHnWfj5NBq9IGtRPqeyrtqbsElXkoEMaSAltBcB8r+wSO/7w8CUPv7Pgc1Ynq8gdcfvdrwpllOkVgf8hnbyOe8WmvEcppxl9o8c0sYUODUDVYhSm0s3zOYghn8lMSxQqZ3GONzaDVkl3mJ4FdXxfWtIESlDjWWcrOh1xBNvkJjBHerxJt7rYNYnOHLWoZpJmMaIPy1k77RYiUz0INqq0B1u9KI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIFuWhFfGwAduO+uG+CZheu7v8Md/DB/7K4gO10NsYIR6X9W2xD2NJwpLSOWpo8Eh/oQ0fCIypCm8IX8Y09pYequ9Kmkk1mK5f+8yoqAVAd95DIIe992X4dNlJM2OEr7MzJ9GyayuWeozsdX9/tE5zW4NW0QvHDYmR0TMRlOESQ7YFfuy0i2i4O2jzxqRxqOv/6uPs0y8S/X9lew66W9zNu84xdNdlP6txxzlbtJQ2hBg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptFlowFilterFunction;
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>